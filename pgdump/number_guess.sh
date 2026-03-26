#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read username

# 检查用户名长度（可选，但确保数据库能接收）
if [ ${#username} -gt 22 ]; then
  username="${username:0:22}"
fi

user_info=$($PSQL "SELECT username, games_played, COALESCE(best_game, 0) FROM users WHERE username = '$username'")

if [[ -z $user_info ]]; then
  echo "Welcome, $username! It looks like this is your first time here."
  $PSQL "INSERT INTO users(username, games_played) VALUES('$username', 0)" > /dev/null
  games_played=0
else
  IFS='|' read username games_played best_game <<< "$user_info"
  echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
fi

secret_number=$(( RANDOM % 1000 + 1 ))

echo "Guess the secret number between 1 and 1000:"
guess_count=0

while true; do
  read guess

  if ! [[ $guess =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  ((guess_count++))

  if (( guess > secret_number )); then
    echo "It's lower than that, guess again:"
  elif (( guess < secret_number )); then
    echo "It's higher than that, guess again:"
  else
    echo "You guessed it in $guess_count tries. The secret number was $secret_number. Nice job!"

    # 更新 games_played
    ((games_played++))
    $PSQL "UPDATE users SET games_played = $games_played WHERE username = '$username'" > /dev/null

    # 获取当前 best_game 并更新（如果本次更好）
    current_best=$($PSQL "SELECT best_game FROM users WHERE username = '$username'")
    if [[ -z $current_best || $guess_count -lt $current_best ]]; then
      $PSQL "UPDATE users SET best_game = $guess_count WHERE username = '$username'" > /dev/null
    fi
    break
  fi
done