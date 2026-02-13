#!/bin/bash

echo "=== Community Platform - Onboarding ==="
echo ""

# Create groups
echo "Creating groups..."
groupadd HR 2>/dev/null
groupadd Accounts 2>/dev/null
groupadd Developers 2>/dev/null
echo "Groups created: HR, Accounts, Developers"
echo ""

# Create users
echo "Creating users..."
useradd -m -g HR hr_user 2>/dev/null
useradd -m -g Accounts accounts_user 2>/dev/null
useradd -m -g Developers dev_user 2>/dev/null
echo "Users created: hr_user, accounts_user, dev_user"
echo ""

# Create directories and files
echo "Setting up files..."
mkdir -p /opt/platform/HR /opt/platform/Accounts /opt/platform/Developers

# HR file - only accessible by HR group
echo "HR confidential data" > /opt/platform/HR/hr_file.txt
chown root:HR /opt/platform/HR/hr_file.txt
chmod 640 /opt/platform/HR/hr_file.txt

# Accounts file - only accessible by Accounts group
echo "Accounts confidential data" > /opt/platform/Accounts/accounts_file.txt
chown root:Accounts /opt/platform/Accounts/accounts_file.txt
chmod 640 /opt/platform/Accounts/accounts_file.txt

# Developers file - only accessible by Developers group
echo "Developers confidential data" > /opt/platform/Developers/dev_file.txt
chown root:Developers /opt/platform/Developers/dev_file.txt
chmod 640 /opt/platform/Developers/dev_file.txt

echo "Files created and permissions set"
echo ""

# Test access
echo "Testing access control..."
echo ""

echo "HR user trying to access HR file:"
sudo -u hr_user cat /opt/platform/HR/hr_file.txt && echo "SUCCESS: Access granted" || echo "ERROR: Access denied"

echo ""
echo "HR user trying to access Accounts file:"
sudo -u hr_user cat /opt/platform/Accounts/accounts_file.txt && echo "SUCCESS: Access granted" || echo "ERROR: Access denied"

echo ""
echo "Accounts user trying to access Accounts file:"
sudo -u accounts_user cat /opt/platform/Accounts/accounts_file.txt && echo "SUCCESS: Access granted" || echo "ERROR: Access denied"

echo ""
echo "Accounts user trying to access Developers file:"
sudo -u accounts_user cat /opt/platform/Developers/dev_file.txt && echo "SUCCESS: Access granted" || echo "ERROR: Access denied"

echo ""
echo "=== Setup Complete ==="
