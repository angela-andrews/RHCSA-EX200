# Users and Groups Overview

## Users and groups on a Linux system

- user: an account that provides access to a system and set security boundaries. It distinguishes users from each other. Identified by their UID.
- group: a collection of users that require access to the same resource. Used for ease of management. Identified by their GID
- superuser - the account that administers the system. Root is the account name and it's UID is 0. Root has full access to the system
- system - are used by processes and daemons that run on the system. They don't require root access, just requires access to what it needs to run. They don't log into the system interactively
- regular user- used for day-to-day work on the system. They have limited access to the system by default
- primary group: the group that gets created when the user is created (same name as user). It's the group that owns the files that the users creates. 
- secondary group: Groups users can be added to to grant access to resources. Also call supplementary groups.
- id command is used to show details about a user
    - UID
    - GID
    - Supplementary groups
    - Security context of the process. Only works on system w/ SELinux enabled

```
id testuser
```
-   /etc/passwd file contains an entry for each user on the system. It has 7 colon-separated (:) fields that hold the following info.
 1. username
 2.  x is the placeholder for the previous encrypted password (moved to /etc/shadow)
 3. UID
 4. GID
 5. Where comments go
 6. Users home directory
 7. default shell

![etc/passwd Entry](/images/etc-passwd.png)




### List of Commands used when managing users and groups
- su
- sudo
- useradd
- usermod
- userdel
- groupadd
- groupmod
- groupdel
- id
- passwd
- visudo
- newgrp

### List of files/directories used in the management of users and groups
- /etc/shadow
- /etc/passwd
- /etc/group
- /etc/sudoers
- /etc/sudoers.d/*

[def]: images/etc-passwd.png