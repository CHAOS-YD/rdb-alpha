# Periodic Table Element Lookup Script
# Usage: ./element.sh <atomic_number|symbol|name>
# Periodic Table Element Lookup Script
# Usage: ./element.sh <atomic_number|symbol|name>
#!/bin/bash

# 数据库查询命令（可根据需要添加更多标志）
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# 如果没有提供参数
if [[ -z $1 ]]; then
    echo "Please provide an element as an argument."
    exit 0
fi

# 判断输入是数字还是字符串
if [[ $1 =~ ^[0-9]+$ ]]; then
    # 按原子序数查询
    RESULT=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius
                    FROM elements
                    INNER JOIN properties USING(atomic_number)
                    INNER JOIN types USING(type_id)
                    WHERE atomic_number = $1")
else
    # 按符号或名称查询（不区分大小写）
    RESULT=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius
                    FROM elements
                    INNER JOIN properties USING(atomic_number)
                    INNER JOIN types USING(type_id)
                    WHERE symbol ILIKE '$1' OR name ILIKE '$1'")
fi

# 如果没有找到匹配
if [[ -z $RESULT ]]; then
    echo "I could not find that element in the database."
    exit 0
fi

# 解析结果（字段由 '|' 分隔）
IFS='|' read ATOMIC_NUMBER SYMBOL NAME TYPE MASS MELT BOIL <<< "$RESULT"

# 输出信息
echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
# Improved element search with case-insensitive matching
# Final output format verified
