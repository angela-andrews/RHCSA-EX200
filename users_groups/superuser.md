# Superuser access

The superuser has full, unlimited access to the system, it's called root on a rhel box. Regular users can assume root's access to perform functions on the system.
- users should *not* log into a system directly as root for security reasons

## Switching user accounts
 - the su command is used to switch to a different account that you know the password for. 
 - su - gives you access to the user's environment. A new login shell, all the scripts are an. As if you logged in as the user. Requires knowing that users password.
 - sudo is used to assume the role of a user on a per command basis. You provide your own password with sudo.
 - sudo -i Sets an interactive root shell. Runs root's default shell and it's login scripts
 - sudo - Root shell without the scripts
 - sudo su - will put you in the root environment, but you enter your own password. You're basically running su as root so you don't need root's password.

 |   | su | su - | sudo | sudo su |
 |---| ---| ---| ---| ---|
 | Become user| Yes| Yes| per command| per command|
 | Env| current user| new user | current user | new user|
 |pwd needed| new user| new user| current user| current user|
 | privs| same as new user | same as new user| defined in sudoers| same as new user|
 
 ```
 sudo useradd temp01
 ```
Current users assumes superuser privileges to create the temp01 user. 

## Ways to grant users admin permissions (superuser)
1. Adding users to the wheel group
2. Edit the sudoers file with visudo
3. Place a config file under /etc/sudoers.d/

### Adding users to the wheel group
- usermod -aG wheel username
- check sudoers with visudo to confirm the wheel group isn't commented out
     - the line should read %wheel ALL=(ALL) ALL

### Editing the sudoers file with visudo
- run visudo as root
- add the user or group to the file
     - username ALL=(ALL) ALL
     - %groupname ALL=(ALL) ALL

### Place a config file under /etc/sudoers.d/
- echo "username ALL=(ALL) ALL" >> /etc/sudoers.d/username
- echo "%groupname ALL=(ALL) ALL" >> /etc/sudoers.d/groupname

### Granting users/groups access to only certain commands

```
steven ALL=(ALL) /path/to/command, /path/to/command
%helpdesk ALL=(ALL) /path/to/command, /path/to/command
```


### Set up a user to sudo without a password (like in Ansible)
- create a file in /etc/sudoers.d/ or use visudo
```
ansible ALL=(ALL) NOPASSWD:ALL
chris ALL=(ALL) NOPASSWD: /bin/kill
%admins ALL=(ALL) NOPASSWD:ALL
```

### Check the syntax and validity of sudoers config files
```
visudo -c
```

## Shell Types
- interactive shell - a shell started without logging into a system. It doesn't behave as a login shell, but it gives you a shell to work in. It doesn't process the  /etc/profile file, rather only checks for what's in the .bashrc in the user's home directory. You get an interactive shell with su - and when you SSH into a system.
- non-interactive shell - Doesn't interact with a user. Usually runs from a script some type of automated function.
- login shell - a shell that runs when you log into a system. It will execute your login scripts so the environment is your own.
- non-login shell- Also called a sub-shell. It's started by a login shell or another program.






 