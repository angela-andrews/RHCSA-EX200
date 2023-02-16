# Links

Files are identified by inodes (index nodes). Inodes keep track of everything about a file except the filename. 
- ownership
- permissions
- date/time
- path to data blocks that contain the file data

They are filesystem specific(xfs,ext4,etc).

File Allocation Table (table that keeps track of the files on a disk)
- filename
- inode

(insert xfs_info / command image)

To see inode
```
ls -li
```
![Hard Link](/images/inode.png)
- inode _8705_
- link count _1_
- hard link created _ln greeting helloworld_
- link count increases by 1
- these files have the same inodes, ownership, permission, date/time and the same path to the data blocks


## Hard Links
- All files start with 1 hard link. It associates a name with a file
- Cannot span devices. Only on the same filesystem
- Cannot point to a directory
- You must be the owner of the file to create a link
- Timestamp is updated when you create the hard link


## Soft Links
- A pointer to the name of the file
- Can span devices
- Can point to a directory
- Deleting the original file in a soft link creates a broken link
- has their own inode

Create a hard link
```
ln originalFile  newFile
```

Create a soft link
```
ln -s originalFile newFile
ln -s originalDir newDir
```

Remove a hard or soft link
```
unlink newDir

unlink newFile
rm newFile

```
