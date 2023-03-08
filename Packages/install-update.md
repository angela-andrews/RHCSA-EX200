# Install and Update Packages

- Packages can be installed via rpm, yum and dnf (recommended)
- DNF can communicate with repos
- DNF can transact against rpm files
- DNF resolves dependencies, rpm cannot

![DNF can do all the things](/images/dnf-cmd.png)

List packages available and installed that begin with node*
```
dnf list 'node*'
```

Search for packages that name & summary contain "xxx"
```
dnf search 'web server'
```

Same as search above,but also searches the description
```
dnf search all 'web server' 
```

Get package info & they don't even need to be installed
```
dnf info podman
rpm -qi podman
```

Search which packages provides a file, even if it's not installed on your system
```
dnf provides /usr/share/nginx
```

Install a package without confirming & only returning the last 6 lines of installation output. 
```
dnf install podman -y
dnf install podman -y | tail -6
```

Remove a package. Don't use -y with remove. You want to see what's being removed and make sure it's not needed by other packages
```
dnf remove podman
```

Update packages. 1) it downloads rpms 2) installs them. Updates the existing software that's currently installed
```
dnf update
```
List Packages that are organized by groups
```
dnf group list
```

Learn more about what packages are in group
```
dnf group info 'NAME OF GROUP"
```

Log File for DNF install and remove actions:
```
tail /var/log/dnf.rpm.log
```

Show dnf history of transactions
```
dnf history
```

Undo a dnf action from history
```
dnf history undo #
```

Install a group
``` 
dnf group install "NAME of GROUP"
```

## DNF Cheat Sheet
| Action | Command |
|---------|-------|
| List installed and available packages by name | dnf list [name>|
| List installed and available groups| dnf group list|
| Search for a package by keyword | dnf search [keyword]|
| Show package details | dnf info [package-name]|
| Install a package | dnf install [package-name]|
| Install a package group | dnf group install [group-name]|
| Update all packages | dnf update |
| Remove a package | dnf remove [package-name]|
| Display dnf  transaction history| dnf history|

## Environment Groups
Logical groupings of available groups. Contains 1 or more of the available groups

## Repos that ship with RHEL 9
RHEL 9 ships with2 repos
- BaseOS: contains core OS components
- AppStream: Combines prod stability and flexibility. Updates throughout out its lifecycle. Each stream has its own lifecycle.
    - Languages
    - Compilers
    - Databases
    - IdM

