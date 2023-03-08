# Mount and Unmount File Systems

List block devices with file system information
```
lsblk --fs
lsblk -fp
```

Device names may change, so it's safer to use the UUID to identify the file system. The UUID is a property of a file system.
* Note: * You can install a filesystem on an un-partitioned disk to take up the entire disk. _/dev/vdb_ the whole disk

blkid: Locate/print block device attributes, like if it has a file system or is swap. Using blkid on a disk with a file system will show the UUID, block size and type.
```
blkid /dev/vdb
```
If nothing is returned, there is no file system on the device. If there is a file system, you'll get details returned.

- Block Devices are listed in the /dev/ directory

Using blkid on a partition:
```
blkid /dev/vdb1
```

df: report the file system disk space usage in human readable format
```
df -h
```

du: Estimate file space usage in human readable summary
```
du -sh
```

findmnt: Search for a file system. List all mounted file systems. It will search in /etc/fstab
```
findmnt -sh
```
## Mount a file system to a directory (temporary mount)
- Create a directory for your mount
- Mount the device to the mount directory 
- Confirm your mount was successful

```
mkdir -py /project
mount /dev/vdb /project
mount -v | grep project
```

## Mount a file system to a directory persistently






