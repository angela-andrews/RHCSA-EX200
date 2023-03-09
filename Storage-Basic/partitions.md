# Partitions, File Systems and Mounts

- Disks make up block devices (/dev/vdb)
- Partitions make up block devices (/dev/vdb1)
- A block device have many partitions depending on the partitioning scheme
- File Systems organize data

## Tools to partition
- Web Console : 1 server at a time
- Ansible : Multiple servers
- fdisk
- gdisk
- parted

## MBR vs GPT

| MBR | GPT|
| -----| -----|
| Bios | UEFI|
| 4 partitions inside main partition table| Max 128 partitions |
| Up to 15 additional partitions |  |
| Primary, extended and logical partitions| |
| Up to 2TiB size disk | up to 8 ZiB size disk| 
| complex | easier|

# Using cockpit to configure partitions
Cockpit could be missing the storage plug-in. You'd have to install it in order to manage storage. Install the cockpit storage plug-in.
```
dnf  install cockpit-storaged
```
To search for cockpit plug-in, do a dnf search.
```
dnf search cockpit-
```
![Cockpit Plugins](/images/cockpit-storaged.png)

What you can do inside cockpit:
- view storage
- create partition table
- format a block device

## Gdisk
gdisk is an interactive GUID partition table manipulator. It's text-mode menu driven and it's used to create or manipulate partition tables
```
gdisk /dev/vdb
```
- The first partition on the device starts at 2048 sectors
- When creating partition of a certain size, us +#G for GiB
- 8300 means Linux file system
- w to write the partition table

## Parted
Parted is a partition manipulation tool. Supports both mbr and gpt. Can be run in interactive mode or as a command.
Steps for parted:
1. Create a disk label
2. Create the partition
3. Set the partition type
4. Set the file system type
5. Set the starting sector 2048s if it's the 1st partition on the block device
6. Set the ending sector. Can be stated in MB,GB
7. Quit the tool
8. Print the out the partition info
9. Run udevadm settle to register the new partition on the system.


Create a disk label. Ms-dos for mbr or gpt
```
parted /dev/vdb mklabel LABEL
```

Create a disk label and partition in 2 commands:
``` 
parted DEVICE mklabel LABEL
parted DEVICE mkpart [PART-TYPE|NAME] FS-TYPE start end

parted /dev/vdb mklabel gpt
parted /dev/vdb mkpart mybackup xfs 2048s 4GB
```

## Creating a file system on a block device
Once you've created the partition, it can't be used for storing data until a file system is put on it. There are several file system types, but focus on xfs and ext4.
```
mkfs.xfs /dev/vdb1
or
mkfs.ext4 /dev/vdb1
```

## Tools to display block devices and their file systems. 
- lsblk: list block devices
- blkid: locate/print block device attributes

List block devices and their file systems. UUID is also displayed if a file system exists.
```
lsblk --fs
```

Get info on a block device. UUID is also displayed if a file system exists.
```
blkid /dev/vdb
```

Get info on a partition. UUID is also displayed if a file system exists.
```
blkid /dev/vdb1
```

## /etc/fstab
The fstab file contains descriptive static information about the file systems. The _mount_, _umount_, and _fsck_ iterate through the fstab file to do their thing.
- /etc/fstab makes it *persistent*. If you don't put the mount here correctly, your system will not boot. _see sanity check below_.
- Each file system is on a separate line
- Mounting a file system via UUID or label is preferred over the device name. 
- There is 6 fields in the fstab file
1. UUID or Label
2. Mount point
3. File System Type
4. Mount options
5. Dump on or off
6. Order of fsck

![fstab](/images/fstab.png)

To mount the file system from /ect/fstab. Command tells mount to read the fstab and mount what's not mounted and do so verbosely. It's also used as a sanity check to see if you edited the file correctly. Will report an error if you didn't.
```
mount -av
```
Use findmnt to do a sanity check on your fstab edits.
```
findmnt --verify
```

Once you've created your partition and updated fstab, run udevadm settle to register the new partitions. and reload the daemon
```
udevadm settle
systemctl daemon-reload
```


