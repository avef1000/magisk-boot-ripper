#!/data/adb/magisk/busybox sh
MODDIR=${0%/*}

# Ensure ASH standalone mode
export ASH_STANDALONE=1

# Verbose logging
ui_print() {
  echo "$1"
}

# Create directory for backups
mkdir -p /sdcard/theRipper

# Trigger backup if requested
if [ -f /data/adb/magisk/backup_trigger ]; then
  ui_print "Initialization..."

  BOOT_PART=$(ls /dev/block/by-name/boot*)
  RECOVERY_PART=$(ls /dev/block/by-name/recovery*)
  if [ -n "$BOOT_PART" ]; then
    ui_print "Found boot partition: $BOOT_PART"
    dd if=$BOOT_PART of=/sdcard/theRipper/boot.img
    ui_print "Boot image copied to /sdcard/theRipper/boot.img"
  else
    ui_print "Boot partition not found!"
  fi
  
  if [ -n "$RECOVERY_PART" ]; then
    ui_print "Found recovery partition: $RECOVERY_PART"
    dd if=$RECOVERY_PART of=/sdcard/theRipper/recovery.img
    ui_print "Recovery image copied to /sdcard/theRipper/recovery.img"
  else
    ui_print "Recovery partition not found!"
  fi
  
  if [ -n "$BOOT_PART" ]; then
    ui_print "Backing up kernel..."
    cd /data/local/tmp
    dd if=$BOOT_PART of=boot.img
    /data/adb/magisk/magiskboot unpack boot.img
    mv kernel zimage
    cp zimage /sdcard/theRipper/
    /data/adb/magisk/magiskboot cleanup
    rm -r boot.img
    ui_print "Kernel copied to /sdcard/theRipper/zimage"
  else
    ui_print "Boot partition not found for kernel backup!"
  fi
  
  rm /data/adb/magisk/backup_trigger
fi
