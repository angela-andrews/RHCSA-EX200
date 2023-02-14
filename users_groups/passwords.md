# Manage Passwords

- /etc/shadow : file that contains encrypted passwords, their salt and the hash using the salt. It's delimited by the $ sign. Only root can read this file
 
 1. The hashing algorithm
 2. Salt
 3. Hash of the password with the salt

![/etc/shadow](/images/etc-shadow.png)

Each field from left to right
- Username
- Encrypted Password
- Number of days since epoch 1-1-1970
- Min number of days until a user can change the password again
- Max number of days until the pwd expires. If it's blank or 0, it doesn't expire.
- Number of warning days until the password will expire
- Number of days after the password expires that the account will be locked.
- Number of days since epoch that the account will expire
- Reserved for future use


- /etc/passwd : The second field of this file used to hold the encrypted password. now moved to the /etc/shadow file.

![/etc/passwd](/images/etc-passwd.png)

Each field from left to right:
- Username
- Former encrypted password field
- UID
- GID
- Comment
- Home directory
- Shell

## Password Aging

- passwd : can be used to lock, unlock, edit expiration and expire an account password
- chage : command that can edit the password's age or force a password change.
- /etc/login.defs is the file where you can change the default password aging rules.


| options | usage |
|---------|-------|
| -l |  List account aging info|
| -d 0| Force password change|
| -E | Set expiration date|
| -m | Min days between password changes |
| -M | Max days password is valid|
| -W | Number of warning days before password expire|
| -I | Number of days before password is locked after it expires|

## Using Date command to find a future date
- date : command used to print or set the date

To pick a date x number of days in the future (like, to expire a password) you can use the date command.

Example: set password to expire in 90 days:
```
date -d "+90 days" +%F
chage -E 2023-5-15 devops
```

Example: Set a password with a min of 0 days, max of 30 days, warning period 14 days, inactivity period 14 days

```
chage -m 0 -M 30 -W 14 -I 14
```

Example: Force the user to change their password at next login.
```
chage -d 0 bknowles
```
## Locking Accounts
- usermod can be used to lock out an account

Example: Lock account immediately
```
usermod -L bknowles
```

Example: Lock account at a specific date
```
usermod -L -e 2023-5-15 nminaj
```

## nologin shell

To configure an account to never be allowed to login (no interactive usage), you can set the shell to /sbin/nologin (you can also use /bin/false, but nologin is more descriptive) using usermod or when first creating the account with useradd

```
useradd -c "NewApp Service Account" -s /sbin/nologin newappsvc
usermod -s /sbin/nologin bsplay
```
