# Default Permissions
- Default permissions are the ones set on any newly created files and directories. 

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
