
#!/sbin/sh

ui_print "*******************************"
ui_print "       Magisk Boot Ripper      "
ui_print "       by Avraham Freeman   "
ui_print "      CashApp: $blackwidow987   "
ui_print "*******************************"

unmask 022

#check environment
ASH_STANDALONE=1
MODDIR=${0%/*}

# load functions
. $MODDIR/common/functions.sh

# installation
ui_print "Initializing..."
if [ "$(prompt_user "Would you like to backup your boot.img?")" = "yes" ]; then
  sh $MODDIR/scripts/backup_boot.sh
fi

if [ "$(prompt_user "Do you want to backup your recovery.img?")" = "yes" ]; then
  sh $MODDIR/scripts/backup_recovery.sh
fi

if [ "$(prompt_user "Would you like to backup your kernel?")" = "yes" ]; then
  sh $MODDIR/scripts/backup_kernel.sh
fi

ui_print "Backups completed"
