# Synchronize Calibre

I use Calibre as my master source for my books but according to the author of
Calibre you should keep your library at your local machine and sync the library
if you want to do backups on a NAS or other external drives. Here's just a few
sources pointing that out:

* [Source #1](https://www.mobileread.com/forums/showthread.php?t=290598)
* [Source #2](https://www.mobileread.com/forums/showthread.php?t=303739)
* [Source #3](https://www.mobileread.com/forums/showthread.php?t=288440)
* [Source #4](https://www.mobileread.com/forums/showthread.php?t=185272)
* [Source #5](https://www.mobileread.com/forums/showthread.php?t=292639)

## Synchronization

I guess I could dig into running a Calibre server but right now I want to be
able to access the library on several computers without internet connection.
This is solved by synchronizing the library between the machine and the NAS.

My Windows machine is always master so [sync.bat](sync.bat) will **mirror** all
data from the local machine to the NAS. This includes removing files and folders
if they're removed locally.

My MacBook Pro is some kind of slave so [sync.sh](sync.sh) will **mirror** all
data from the NAS to the local machine. This includes removing files and folders
if they're removed from the NAS.

## TODO

* Add support to select syncornization way (source/destination) Look into
* `CALIBRE_OVERRIDE_DATABASE_PATH` and acutally storing the files on the NAS
  instead of synchronize it.