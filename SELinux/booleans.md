# SELinux Booleans
Semanage booleans control the settings of booleans in SELinux policies. They are either on or off. If you need to use a service and it's blocked by a policy and doesn't require a policy change, you can set a boolean on to enable the policy.

## List SELinux Booleans 
```
getsebool -a

semanage booleans-l
```
### To have a more detailed descriptions of what the booleans do, install the _selinux-policy-devel_ package

```
dnf install selinux-policy-devel -y
```

## Turn on/off a boolean

```
setsebool -P <boolean> <on|off>
getsebool <boolean>
```

## Display the current state of any custom local changes
```
semanage boolean -l -c
```