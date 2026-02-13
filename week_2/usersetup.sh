#!/bin/bash

echo '=== User Setup Script ==='
echo ''

sudo groupadd HR && echo 'Group created: HR'
sudo groupadd Accounts && echo 'Group created: Accounts' 
sudo groupadd Developers && echo 'Group created: Developers'
echo ''

sudo useradd -m -g HR Grace_hr && echo 'user created: Grace_HR' 
sudo useradd -m -g Accounts Daniel_accounts && echo 'user created: Daniel_Accounts' 
sudo useradd -m -g Developers Alice_dev && echo 'user created: Alice_Developers'

echo 'You Just had access to a confidential data, only hr group member can view it' >  Employee_data.txt

echo 'This is the account book of the company, only account group member can access' >  AccountBook.xlsx

echo 'This is the API calls for mobile_app, only dev group member can access' >  API_call.py

# Set ownership and permissions for the file
sudo chown Grace_hr:HR Employee_data.txt && echo 'File ownership changed to user: Grace_hr, group: HR'
sudo chmod 640 Employee_data.txt

sudo chown Daniel_accounts:Accounts AccountBook.xlsx && echo 'File ownership changed to user: Daniel_accounts, group: Accounts'
sudo chmod 640 AccountBook.xlsx

sudo chown Alice_dev:Developers API_call.py && echo 'File ownership changed to user: Alice_dev, group: Developers'
sudo chmod 640 API_call.py

echo ''
# testing file access for each user
sudo -u Grace_hr cat Employee_data.txt
sudo -u Grace_hr cat AccountBook.xlsx
sudo -u Grace_hr cat API_call.py
echo ''
sudo -u Daniel_accounts cat Employee_data.txt
sudo -u Daniel_accounts cat AccountBook.xlsx
sudo -u Daniel_accounts cat API_call.py
echo ''
sudo -u Alice_dev cat Employee_data.txt
sudo -u Alice_dev cat AccountBook.xlsx
sudo -u Alice_dev cat API_call.py

