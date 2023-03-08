# Default Permissions
- Default permissions are the ones set on any newly created files and directories. 
 
 ## Basic File Permissions
 - Basic file permissions are based on what user owns it, what group owns it and what permissions everyone else has to the file.
 - User, Group, Other is how basic file permissions are assigned.
 - There are 3 levels of permissions for files:
    - Read = 4
    - Write = 2
    - Execute = 1
 - These numbers make up the octal permissions of the file and they differ based on if it's being applied to a file or directory.

 | Permissions | On Files | On Directories| 
|-------------|-------------|-------------|
| Read| Open file & view contents | List directory contents | 
| Write| Modify file contents | Create/delete files/diretories |
| Execute | Run a program/script | change directory (cd) |


- Special permissions can be applied to files and directories to add an additional type of permission that's much more granular that regular permissions.

- setuid - Set user identity
- setgid - Set group identity
- sticky bit - Only root and the file/directory owner can remove it


| Permissions | On Files | On Directories| 
|-------------|-------------|-------------|
| u + s / 4###| File is executed with the privileges of the users that owns the file, not as the user that just ran it | N/A|
| g + s  / 2###| File is executed with the privileges of the group that owns the file | Newly created files are owned by the group that owns the directory | 
| o + t / 1###| N/A | You can only remove the files you own. |


## Setuid
![Setuid](/images/setuid.png)

## Setgid
![Setgid](/images/setgid.png)

## Sticky Bit
![Sticky Bit](/images/stickybit.png)


## How to set special permissions
Special permissions can be set either symbolically or numerically(octal):

Setuid on a file numerically and symbolically
```
chmod 4660 testscript.sh
chmod u+s testscript.sh
```

Remove setuid on a file numerically and symbolically with a minus or a an extra zero.
```
chmod 00660 testscript.sh
chmod u-s testscript
```

Setgid on a folder numerically and symbolically
```
chmod 2770 group-project
chmod g+s group-project
```

Set Sticky Bit on a folder numerically and symbolically
```
chmod 1777 dropbox
chmod o+t dropbox
```
## Default File Permissions

Directories have an initial permission of 777
Files have an initial permission of 666
The umask (file creation mask) defines the default mode of newly created files and directories. It clears bits from the mode to create the _actual_ permission of the file/directory upon creation. 

The shell start up scripts set the default umask. Depending on the UID, the umask will be 002 if the account UID is over 200. If not, the umask is 002 (like for root)

### Check the current umask
```
umask
```

## Calculating umask
The umask takes bits off of the initial permissions. Each symbolic permission has a number associated with it:
- r = 4
- w = 2
- x = 1

The umask will take bits away.

![Umask on directories](/images/umask-dir.PNG)
![Umask on file](/images/umask-file.PNG)

## Files that set default umask 
- /etc/bashrc
- /etc/profile
- /etc/profiles.d/local-mask.sh

Users can set their own umask in 
- ~/.bashrc
- ~/.bash_profile


