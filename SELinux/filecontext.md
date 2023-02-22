# SELinux File Contexts

## Setting Context on File and Directories

- Newly created files or directories inherit the contexts of their parent directory (under most circumstances).
- Copied files will also inherit the context from the parent directory.


- semanage fcontext
- restorecon

## Database of labeling polices
- /etc/selinux/targeted/contexts/files
- List file context police rules
```
semange fcontext -l
```

## Copying files vs Moving files

## Changing the SELinux context on directories
- Copied files will also inherit the context from the parent directory.
- Moved files keep their original context 

### The Pirate

![The Pirate](/images/pirate.png)

## Semange fcontext options
| options | usage |
|---------|-------|
| -a    | Add a record of the specified object type|
| -d | Delete a record of the specified object type | 
| -l | List records | 
| -m | Modify a record of the specified object type | 
| -t | SELinux type for the object | 

:star2: Always remember to use restorecon -Rv after semanage fcontext

## Steps for installing apache, using the home directory as the document root and setting the context.

dnf install httpd -y
systemctl enable --now httpd
firewall-cmd --add-service httpd
vim /etc/httpd/conf/httpd.conf
echo "<h1>Hello World</h1> > /home/user1/custom/index.html
semanage fcontext -a -t httpd_sys_context_t '/home/user1/custom(/.*)?'
restorecon -RFv /home/user1/custom
setsebool httpd_enable_homedirs on


## Installing semange man pages




