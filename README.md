# Practical DevOps week 2

This is shell script to create user groups and users, provision example files, set ownership/permissions, and verify access for each user. This is the week 2 assignment from the Pratcial Devops Bootcamp.

## 🔧 What the script does

- Creates groups: `HR`, `Accounts`, `Developers`
- Adds users (with home directories) and assigns each to a group:
  - `Grace_hr` → `HR`
  - `Daniel_accounts` → `Accounts`
  - `Alice_dev` → `Developers`
- Creates example files to demonstrate access controls:
  - `Employee_data.txt` (HR-only)
  - `AccountBook.xlsx` (Accounts-only)
  - `API_call.py` (Developers-only)
- Sets file ownership and permissions (`chmod 640`) so only the owner and group can read/write appropriately
- Tests file access using `sudo -u <user> cat <file>` for each user

## ✅ Requirements

- Linux (tested on Wsl Ubuntu)
- `sudo` privileges to create users/groups and change file ownership
- Run as a user with permission to execute `sudo`

## Usage

1. Make the script executable (if not already):

   chmod u+x usersetup.sh


2. Run the script with sudo (recommended):

   sudo ./usersetup.sh
   



## How to verify manually

- List files with ownership/permissions:

  ls -l Employee_data.txt AccountBook.xlsx API_call.py
  

- Check access as a user (done by the script):

  sudo -u Alice_dev cat API_call.py
  sudo -u Grace_hr cat Employee_data.txt
  sudo -u Daniel_accounts cat AccountBook.xlsx

## Troubleshooting

- "groupadd: group 'X' already exists" — harmless if the group already exists; script continues.
- Permission denied when reading files — ensure the user is in the correct group and file ownership/permissions were applied.
- If users already exist, `useradd` may fail; remove or rename existing test accounts before re-running.

## Security notes ⚠️

- This script is for demonstration/lab use only. Do not run in production unchanged.
- It creates system users and modifies file ownership — review before execution.

## License & Author

- Repository: `Practical_DevOPs`
- Author: Osibajo Oluwasegun
