# VDO - Stratis

## VDO

Install VDO packages
```
dnf install vdo kmod-kvdo
```

If you can't remember the package name, search for it:
```
dnf search "Virtual Data"
```

- RHEL 9 uses a different VDO implementation than RHEL 8. LVM VDO. It's based off of LVMs
- An LVM VDO is composed of 2 logical volumes
  - VDO Pool LV : This LV stores dedupe data (meta data)
  - VDO LV: Its the virtual device on top of the VDO Pool LV. It's the LV you format and store your data on

## Check devices
```
lsblk -fp
```

## Creating the PV :arrow-right: VG :arrow-right: LV
You'll follow the same commands for creating the PV and VG, but creating the LV requires you to designate it as an VDO LV.
```
lvcreate --type vdo --name [lv_name] --size 5G [vg_name]
vdostats --human-readable
```
If you do an lvdisplay, you’ll see the 2 logical volumes that LVM VDO is made of:

### Create the file system 
```
mkfs -t xfs /dev/[vg_name]/[lv_name]
or 
mkfs -t ext4 /dev/[vg_name]/[lv_name]
```

Create your mount point & make it persistent. Note: If you were mounting an iSCSI volume, you’d have to change the mount options to _netdev. This allows /etc/fstab to wait for the network to be available before trying to mount the network volume.
```
lsblk -fp  
mkdir /mnt/thin-data
cp /etc/fstab /etc/fstab.bak
blkid -s UUID -o value /dev/vg01/vdo-lv01 >> /etc/fstab
vim /etc/fstab
findmnt - - verify
udevadm settle
mount -av
```

:heavy_exclamation_mark: blkid -s UUID -o value /dev/vg01/vdo-lv01 >> /etc/fstab
- -s is to match tags. We’re looking for UUID (could be type and label)
- -o is offset (could be value, device,export or full)
