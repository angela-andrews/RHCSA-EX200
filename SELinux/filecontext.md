# SELinux File Contexts

## Setting Context on File and Directories

- Newly created files or directories inherit the contexts of their parent directory (under most circumstances).
- Copied files will also inherit the context from the parent directory. 
    - To have a copied file retain it's attributes, use _cp -p_.
    - To have a copied file keep only the SELinux context, use _cp -c_.
- Moved files will bring the context from their source parent directory.
- When a file is created in their default locations (like a webserver doc in /var/www/html), the new files receive the correct SELinux context. If you create webserver files in non-default locations, you must adjust the context and make SELinux aware.

### How to set the file context:
- semanage fcontext -  used to  manage the default file  system  labeling
       on  an  SELinux system.
- restorecon - restores files default security context so it withstands a relabeling (in the case of cracking the root password)

## Database of labeling polices
- /etc/selinux/targeted/contexts/files
- List file context police rules
```
semange fcontext -l
```

## Copying files vs Moving files
- Copied files will also inherit the context from the parent directory.
- Moved files keep their original context 

## Changing the SELinux context on directories
- semanage fcontext & restorecon (recommended method)
- chcon (temporary method, will not withstand a file system relabeling)

### Scenario
I'm attempting to create a non-default directory to serve up my website
```
sudo mkdir /webserver





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

:star2: Always remember to use _restorecon_ -Rv after _semanage fcontext_

## Steps for installing apache, using a non-default directory as the document root and setting the context.

- dnf install httpd -y
- vim /etc/httpd/conf/httpd.conf  <change DocumentRoot
- cp /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.conf.bak <comment out all lines
- echo "<h1>Hello World</h1> > /webserver/index.html
- systemctl enable --now httpd
- firewall-cmd --add-service httpd
- semanage fcontext -a -t httpd_sys_context_t '/webserver(/.*)?'
- restorecon -RFv /webserver








