# Manage Local User Accounts

## Create Users
- useradd : creates users, home directories, private groups and shell.
- passwd: sets or changes passwords
- /etc/login.defs : File that used to set the defaults for new accounts and groups.
- user ID (UID) is over 1000 unless you state otherwise.


| options | usage |
|---------|-------|
| -c |  Add a comment|
| -e | expiration date|
| -G | a list of supplementary groups |
| -r | Create a system account|

```
useradd -G wheel -c "Beyonce Knowles-Carter" bknowles
```

## Modify Users
- usermod : modify existing users properties


| options | usage |
|---------|-------|
| -aG |  append supplementary groups|
| -c | Add/edit comment|
| -L | lock account|
| -u | unlock account|
| -e | set expiration date|
| -s | set shell |


```
usermod -aG admin bknowles
usermod -g admins dtedesco
```


## Delete Users
- userdel : delete a user
- Before deleting a user, find all files owned by them and transfer ownership with the chown command.

```
find / -user bknowles
```


| options | usage |
|---------|-------|
| -f |  force remove account|
| -r | remove home dir|
| -Z | remove SELinux mapping|

```
userdel -r bknowles
```
## UIDs
- UID 0 is the root UID
- UID 1-200 is the UIDs for system accounts statically assigned
- UID 201-999 are the UIDs assigned to system processes that don't own system files. Unprivileged UIDs
- UID 1000+ Regular Users, unprivileged

