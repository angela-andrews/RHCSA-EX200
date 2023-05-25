# Create and Extend Storage (LVM and VDO)

- Physical Devices: Actual physical(or virtual) devices that are used to store data.
- Physical Volumes: Devices on the system that become physical volumes.
 - Can be made up of whole disks or partitions
- Volume Groups: A group of 1 or more physical volumes that make up the pool from which to create logical volumes
- Logical Volumes: The volumes that are configured to be used for file system storage or swap.

![PV to VG to LV](/images/pv-vg-lv.png)

## LVM workflow
1. Initialize physical devices as physical volumes (pv)  (pvcreate)
2. Create a volume group (vg) from 1 or more pvs (vgcreate)
3. Create logical volumes (lv) from the vg (lvcreate)
4. Format the logical volumes with a file system (mkfs)
5. Mount the lv as storage or swap (mount)

## Preparing Physical Devices for LVM
Physical devices must be prepared before a file system can be added. Use parted to initialize a disk as either gpt or mbr. 
### Partition the device (disk label for gpt)
```
parted /dev/vdb mklabel gpt
```

### Create the 1st partition and make it 10G (or use entire disk)
```
parted /dev/vdb mkpart data-disk 2048s 10G
```

### Create the 2nd partition and make it 10G 
``` 
parted /dev/vdb mkpart data-disk2 10000Mib  20G
```
 ### Set the partitions for LVM
 ```
 parted /dev/vdb set 1 lvm on
 parted /dev/vdb set 2 lvm on
 ```

 Always run this after creating/editing partitions
 ```
 udevadm settle
 parted /dev/vdb print
```

### Create  PV from the partitions
```
pvcreate /dev/vdb1 /dev/vdb2
```

### Create VG & give it a name
```
vgcreate [vg_name] /dev/vdb1 /dev/vdb2
```

### Create LV from VG and give it a name. Use actual size or number of extents
```
lvcreate -n [lv_name] -L 7G [vg_name]
or
lvcreate -n [lv_name] -l 71 [vg_name]
```

### Format the lv & confirm
```
mkfs.ext4 /dev/[vg_name]/[lv_name]
lsblk -fp
```

### Create a directory to mount the file system to, then mount it.
```
mkdir /mnt/data
mount /dev/[vg_name]/[lv_name]
```

### To make the mount persistent, you must add it to /etc/fstab via device mapper name or UUID
```
cp /etc/fstab /etc/fstab.bak
blkid -s UUID -o value /dev/[vg_name]/[lv_name] >> /etc/fstab
vim /etc/fstab
findmnt --verify
umount /mnt/data
mount -av
```
:star: You can also use /etc/mtab to populate /etc/fstab
```
cp /etc/fstab /etc/fstab.bak
cat /etc/mtab | grep /dev/[vg_name]/[lv_name] >> /etc/fstab
cat /etc/fstab
findmnt --verify
umount /mnt/data
mount -av
```
## Checking lvm status
```
pvdisplay
vgdisplay
lvdisplay

pvs
vgs
lvs
```
### What pvdisplay shows
| Field | Meaning|
| -----| -----|
| PV Name | Physical (device) volume|
| VG Name | Volume Group Name | 
| PV Size| Physical size of the PV with unusable space|
| PE Size| Size of the extents |
| Free PE | # of Physical Extents available to add storage |

### What vgdisplay shows
| Field | Meaning|
| -----| -----|
| VG Name| Volume Group Name |
| VG Size | Total storage pool size |
| Total PE | Size of VG in physical extents| 
| Alloc PE | How many PE are used in LVs |
| Free PE | Available PE free to use |

### What lvdisplay shows
| Field | Meaning|
| -----| -----|
| LV Path | Device Name of LV (used to mount)|
| LV Name| Name of LV |
| VG Name |  VG the LV comes from |
| LV UUID | UUID of the LV (used to mount) |
| LV size | Size of LV. Use df and du to see space|
| Current PE | # of extents used to make the LV|


## How to Extend and Reduce a LVM
You can add PV to a VG to make more space available for LVs.

### Prepare the device and create the PV to add to the pool
```
parted /dev/vdb mkpart [gpt_part_name] [start] [end]
parted /dev/vdb set 3 lvm on
udevadm settle
parted /dev/vdb print
```
### Create the PV
```
pvcreate /dev/vdb3
pvdisplay
```

### Add new PV to the VG
```
vgextend [vg_name] /dev/vdb3
vgdisplay
```
### Extend an LVs size & simultaneously resize the file system with -r.
```
lvextend -r -L +10G /dev/[vg_name]/[lv_name]
lvdisplay
```

### If you don't use -r with extending the LV, you can resize the file system separately.  xfs and ext3 use different commands:
```
xfs_growfs /mnt/data
resize2fs /dev/[vg_name]/[lv_name]
```
:warning: EXT4 can be sized up and down. XFS cannot be sized down (shrunk)

## Extend Swap Space on LV

### Turn off Swap
```
swapoff -v /dev/[vg_name]/[lv_name]
```

### Extend LV size
```
lvextend -L +500M /dev/[vg_name]/[lv_name]
```

### Format new space as swap
```
mkswap /dev/[vg_name]/[lv_name]
```

### Turn swap back on
```
swapon /dev/[vg_name]/[lv_name]
```

## Reduce VG Size & remove a PV (this can be destructive: backup data 1st)
To reduce a VG, you must move the data off of a device first. *Remember: xfs can't be reduced*
```
pvmove /dev/vdb3
vgreduce [vg_name] /dev/vdb3
```

### Remove LVM storage
Be sure to back up the lvs first. scp, rsync, cp.

### Unmount the file system
```
umount /mnt/data
```
### Remove entry from /etc/fstab
You can use dd to remove the entire line and save it. Be sure to run findmnt --verify to check for errors and run systemctl daemon-reload.
### Remove the LV
```
lvremove /dev/[vg_name]/[lv_name]
```
### Remove the VG
```
vgremove [vg_name]
```

### Remove the PV
```
pvremove /dev/vdb1 /dev/vdb2
```

## Word Cloud of the various terms in this section:
![Word Cloud](/images/wordcloud-strorage.png)