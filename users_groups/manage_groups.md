# Manage Groups

- Primary groups are shown in /etc/passwd. All new files are owned by the user and the primary group unless overwritten.
- Secondary groups are shown in /etc/group
- Groups are used to assign permissions.

## Creating Groups
- groupadd : create a group
- /etc/login.defs : File that used to set the defaults for new accounts and groups.
- group ID (GID) is over 1000 unless you state otherwise.

| options | usage |
|---------|-------|
| -g |  Custom GID|
| -r | Create a system group|

```
groupadd -g 40000 developers
```

## Modifying Groups

- groupmod : modify a group's properties

| options | usage |
|---------|-------|
| -g |  change GID|
| -n | rename group |

```
groupmod -n developers devgroup
```
## Remove user from group
- gpasswd : administer /etc/group and /etc/gshadow

```
gpasswd -d latavia destinyschild
```

## Deleting Groups
- groupdel : delete a group
- You can't remove a group if it is a user's primary group. User usermod -g to change a user's primary group before deleting it.

```
groupdel beyhive
```
## Temporarily change your primary group
- Users can temporarily change their primary group on the command line.Example: You're about to create several files and you want another group you belong to to own them.
- newgrp : switch your primary group for your current shell session

```
[bknowles@server1 ~] newgrp destiny
```