# Systemd: Automatically started processes

Systemd activates system resources, server daemons and other processes at boot and also as a system is running. 
- Daemon: processes that run to perform a task.
 - They start at boot time
 - Daemons usually end in _d_
 - systemd daemon is the first process and is PID1. 
- Service: 1 or more daemons
- Units: Different "processes" that run. They all spawn from systemd and they have different extensions
 - path: watches file and directory changes
 - mount: controls mounts
 - timer: scheduling
 - slice: resource management (control groups). Sets resource limits
 - socket: Listens on ports. Only runs when a connection is made
 - target: Group of units. A group of related units
 - service: System services, daemons
- systemctl: the command used to manipulate units

### List out Unit types
```
systemctl -t help
```

### List active units of type service
```
systemctl list-units --type=service
```
When you list out the service units, the columns are as follows:
| Heading | Meaning |
| ------| ------|
| Unit | Unit Name |
| Load | Loaded into memory |
| Active| Is it started (high-level)|
| Sub| Is it running (low-level)|
| Description | Short description|

### List all units of type service. Loaded & not found
```
systemctl list-units --type=service --all
```

### List both loaded and active units
```
systemctl
```

### List all installed unit files. Enabled or disabled
```
systemctl list-unit-files --type service
```


