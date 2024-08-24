#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Salon Appointment ~~~~~"
echo  -e "~~~~~ Our salon offers the following services ~~~~~\n"

SERVICES_MENU() {
# get services offered from services table
AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services")
# display available servies

echo "$AVAILABLE_SERVICES" | while read service_id BAR name 
do
  echo "$service_id) $name"
done
echo -e "Please select one of the above services"
# read the service desired by the user
read SERVICE_ID_SELECTED 
# check if the service selected is in the services table 
SERVICE_ID_AVAILABLE=$($PSQL "SELECT service_id FROM services WHERE service_id= $SERVICE_ID_SELECTED")

# if the service is not offered 
if [[ -z $SERVICE_ID_AVAILABLE ]]
then 
    # send to the list of services
      SERVICES_MENU
else
      # ask the  customer for their phone number
      echo -e "Please enter your phone number"
      read CUSTOMER_PHONE
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone= '$CUSTOMER_PHONE'")

      # check if they are in the customer table
      if [[ -z $CUSTOMER_ID ]]
      then         
        echo "please enter your name"
        read CUSTOMER_NAME
        # add the customer's phone and name to the customers table
        INSERT_CUSTOMER_INFO=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')") 

        # get the new customer id 
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone= '$CUSTOMER_PHONE'")
      fi
      # get a time from the customer
      echo "please enter a time"
      read SERVICE_TIME 

      # Insert into appointments tables
      INSERT_APPOINTMENT_INFO=$($PSQL "INSERT INTO appointments(customer_id, service_id ,time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED,'$SERVICE_TIME')") 

      # get customer name 
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone= '$CUSTOMER_PHONE'")

      # get the service name

      SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id= '$SERVICE_ID_AVAILABLE'")

      

      # confirming the appointment with the customer

      echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME,$CUSTOMER_NAME."

fi 

}

SERVICES_MENU 


