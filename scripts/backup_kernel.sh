#!/sbin/sh

ui_print "Extracting kernel"
cd /cache
dd if=/dev/block/by-name/boot of=boot.img
magiskboot unpack boot.img
mv kernel zImage
ui_print "creating multiple formats for you"
cp zImage /sdcard/theRipper/zImage
cp zImage /sdcard/theRipper/Image
cp zImage /sdcard/theRipper/kernel
ui_print "cleaning up"
magiskboot cleanup
rm -r boot.img

if [ $? -eq 0 ]; then
  ui_print "Kernelbackup successful"
  ui_print "checkout /sdcard/theRipper"
else
  ui_print "kernel backup failed, please open an issue"
  ui_print "cleaning up"
fi
