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
dnf group info 'NAME OF GROUP'
```

Log File for DNF install and remove actions:
```
tail /var/log/dnf.rpm.log
```

Show dnf history of transactions
```
dnf history
```

View history for a specific tranaction
```
dnf history info #
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


## Module Streams
- A single repo can host multiple versions of 1 app. 

![Module Streams](/images/module-streams.png)

- AppStream contains 2 types of content:
    - modules
    - traditional RPM packages
- Modules: A set of RPM packages that belong together
    - Can contain several streams for multiple versions
    - Each module has 1 or more streams with different versions of content

Module = Packages + Package Dependencies and libraries + Docs and helper utilities

- RHEL 9 ships without modules. You must manually specify default module streams. Define module streams in /etc/dnf/modules.defaults.d

## Module Profiles
- Common: Production Ready
- Devel: Packages for modification
- Minimal: Smallest # of packages to run

## Managing Modules with DNF
List available modules
```
dnf module list
```

List the module streams for a specific module & retrieve the status
```
dnf module list [module]
```

Display module details, all available profiles and a list of packages that it installs.
```
dnf module info [module name]
```

View specific module stream
```
dnf module info [module name]:stream
```

View info about each profile
```
dnf module info [module name] --profile
```

Which module provides a specific package
```
dnf module provides [package]
```

Search for a module with module name as part of the summary
```
dnf search [module]
```

Get more info about a module
```
dnf info [module]
```

Install a module
```
dnf install [module]
```

Remove a module. Always review what packages are being removed. Other software may require them.
```
dnf remove [module]
```

