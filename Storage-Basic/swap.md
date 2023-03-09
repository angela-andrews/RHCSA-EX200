# Swap

Systems must have swap just in case physical memory runs out. Swap involves taking data from memory and writing it to disk.

To show available memory on system:
```
free -m
```

## Creating Swap space
Check lsblk for an available block device. If one hasn't been created, check the [partitions page](/Storage-Basic/partitions.md) for info.  Then use the _mkswap_ command to format it.
```
lsblk -fp
mkswap /dev/vdb1
```

## Mount swap in the /etc/fstab
UUID, swap, swap, mount options, 0, 0. 
- Mount options can be default or you can set a priority on what order the swap is used. _Example: pri=100_
- Always run systemctl daemon-reload after editing /etc/fstab
```
systemctl daemon-reload
mount -av
```

## Activate and deactivate Swap
If you've mounted the swap via the fstab, it will show as ignored. You must use the swapon command.
```
swapon --all
swapon --show
```

You can activate swap via the block device without adding it to /etc/fstab. This is the temporary way.
```
swapon /dev/vdb1
```

Use the free command to see the available swap
```
free -m
```
