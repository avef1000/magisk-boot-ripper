#!/sbin/sh

ui_print "Backing up recovery image..."
dd if="/dev/block/by-name/recovery" of="/sdcard/theRipper/recovery.img"
if [ $? -eq 0 ]; then
  ui_print "Recovery image backup successful!"
else
  ui_print "Recovery image backup failed!"
fi
