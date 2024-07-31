#!/sbin/sh

ui_print "backing up boot.img..."
dd if="/dev/block/by-name/boot" of="/sdcard/theRipper/boot.img
if [ $? -eq 0 ]; then
  ui_print "boot.img backup successful!"
  ui_print "go check out /sdcard/theRipper"
else
  ui_print "Sorry, boot.img backup failed"
  ui_print " please open an issue on github"
fi
