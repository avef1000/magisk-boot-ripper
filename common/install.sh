#!/sbin/sh

ui_print "*******************************"
ui_print "       Magisk Boot Ripper      "
ui_print "       by Avraham Freeman   "
ui_print "     CashApp: $blackwidow987   "
ui_print "*******************************"

# ensure correct environment
ASH_STANDALONE=1
MODDIR=${0%/*}

#load function
. $MODDIR/common/functions.sh

# installation
ui_print "Initializing..."

sh $MODDIR/customize.sh

ui_print "Installation complete."
