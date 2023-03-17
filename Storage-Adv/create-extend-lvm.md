# Create and Extend Storage (LVM and VDO)

- Physical Devices: Actual physical(or virtual) devices that are used to store data.
- Physical Volumes: Devices on the system that become physical volumes.
 - Can me made up of whole disks or partitions
- Volume Groups: A group of 1 or more physical volumes that make up the pool from which to create logical volumes
- Logical Volumes: The volumes that are configured to be used for file system storage or swap.

![PV to VG to LV](/images/pv-vg-lv.png)

## LVM workflow
1. Initialize physical devices as physical volumes (pv)
2. Create a volume group (vg) from 1 or more pvs
3. Create logical volumes (lv) from the vg
4. Format the logical volumes with a file system
5. Mount the lv as storage or swap 

## Preparing Physical Devices
Physical devices must =======================