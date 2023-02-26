# SELinux Enforcement Mode

- SELinux means security-enhanced Linux. Mandatory Access Control (MAC)Architecture. It enforces access rules that are very explicit about who and what can access resources (files, ports, processes, directories). Every resource has  an SELinux context label. The context label must match the policy that allows its behavior. If the label doesn't match, the policy is denied and logged.

SELinux has 3 modes: 
- Enabled : Polices are loaded. This is the RHEL default. Any violations are logged.
- Disabled: SELinux isn't loaded. Any violations aren't logged.
- Permissive: Polices are loaded, but nothing is blocked or constrained. Any violation are logged. Good for testing and debugging.

SELinux Labels
- SELinux polices define rules based on the context.
    - Type: _t
    - User: _u
    - Role: _r
    - Security Level: ^s
  
Context labels can be applied to
- files
- directories
- ports
- processes
- users
They define what the resource is and rules are create to match the labels. 

- Note: you can no longer disable SELinux with the config file. you can either disable it via the bootloader by appending _selinux=0_ to the end of the line or you can run the following to have the bootloader pass selinux=0 at each boot:
```
grubby --update-kernel ALL --args selinux=0
```

To re-enable it:
```
grubby --update-kernel ALL --remove-args selinux
```

## SELinux modes
- getenforce: displaces the current mode
- setenforce: 1 or 0 either enables SELinux or disables it.
- sestatus: details the current SELinux status. -v gives more details

## View SELinux options
To view the SELinux options on files, directories, users,, processes, etc, use the -Z option
```
ps auxZ
ls -ldZ
id -Z
```

