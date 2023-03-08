# File Permissions

## Directory and File permissions
- chmod changes directory and file permissions
- permissions are changed either via the octal method or symbolically with letters
    - octal : read = 4 write = 2 execute = 1 for user, group and other
    - symbolic: u = user g = group o = other  a = all

## Octal/Numeric method

```
chmod 644 memo.txt
```

![Numeric Permissions](/images/numeric-perms.png)

## Symbolic Method

```
chmod a+x checkspace.sh
```

![Symbolic Permissions](/images/symbolic-perms.png)

Note: If you want to set the rwx on a directory recursively, you may make all of the files executable by mistake. To set rwx on a directory and _not_ change all files to executable, use capital X as execute.


```
chmod -R a=rwX /data
```

## More examples
Check out the [permissions chapter](https://fedoraproject.org/wiki/Administration_Guide_Draft/Permissions#Managing_Permissions_Using_The_Command_Line_Interface) on Fedora Project Documentation

## Ownership
- The user that creates a file is the user owner
- The primary group of the user that creates the file is the group owner of the file
- You can change the user or group owner of a file or directory with _chown_ or _chgrp_ for changing group ownership.

```
chown :devops /data/jenkins
chgrp devops /data/jenkins
chown  admin:admin /data/containerfiles
chown riri myfile123
```

![Ownership](/images/ownership.png)




_Images from the Fedora project documentations used under Creative Common Attribution 4.0 International (CC BY 4.0)_

