#!/bin/bash

# Function to display the numbered list of services
show_services() {
    psql --username=freecodecamp --dbname=salon -t --no-align -c "SELECT service_id || ') ' || name FROM services ORDER BY service_id;" 2>/dev/null
}

# Loop until a valid service is chosen
while true; do
    show_services
    echo "Please enter the service_id of the service you want:"
    read SERVICE_ID_SELECTED

    # Check if service exists
    SERVICE_EXISTS=$(psql --username=freecodecamp --dbname=salon -t --no-align -c "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED;" 2>/dev/null)
    if [[ -z "$SERVICE_EXISTS" ]]; then
        echo "Invalid service. Please try again."
        continue
    fi
    break
done

# Get service name
SERVICE_NAME=$(psql --username=freecodecamp --dbname=salon -t --no-align -c "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;" 2>/dev/null)

# Prompt for phone number
echo "Please enter your phone number:"
read CUSTOMER_PHONE

# Check if customer exists
CUSTOMER_ID=$(psql --username=freecodecamp --dbname=salon -t --no-align -c "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';" 2>/dev/null)

if [[ -z "$CUSTOMER_ID" ]]; then
    # New customer: ask for name and insert
    echo "Please enter your name:"
    read CUSTOMER_NAME
    psql --username=freecodecamp --dbname=salon -c "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME');" > /dev/null 2>&1
    CUSTOMER_ID=$(psql --username=freecodecamp --dbname=salon -t --no-align -c "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';" 2>/dev/null)
else
    # Existing customer: get their name
    CUSTOMER_NAME=$(psql --username=freecodecamp --dbname=salon -t --no-align -c "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID;" 2>/dev/null)
fi

# Prompt for appointment time
echo "Please enter the time for your appointment:"
read SERVICE_TIME

# Insert the appointment
psql --username=freecodecamp --dbname=salon -c "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');" > /dev/null 2>&1

# Confirmation message
echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
