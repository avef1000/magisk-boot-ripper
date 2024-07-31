#!/sbin/sh

# Shared functions for Magisk Boot Ripper by Avraham Freeman
# CashApp: $blackwidow987

# Function to print messages to UI
ui_print() {
  echo -e "ui_print $1\n"
}

# require minimum magisk version
require_new_magisk() {
  ui_print "*******************************"
  ui_print " Please install Magisk v20.4+! "
  ui_print "*******************************"
  exit 1
}

# volume key function - this is fascinating that it works
prompt_user() {
  local prompt="$1"
  local answer

  ui_print "$prompt (Volume Up: Yes, Volume Down: No)"
  while true; do
    getevent -lc 1 2>&1 | grep VOLUME >/dev/null
    if [ $? -eq 0 ]; then
      getevent -lc 1 2>&1 | grep "KEY_VOLUMEDOWN" >/dev/null && answer="no"
      getevent -lc 1 2>&1 | grep "KEY_VOLUMEUP" >/dev/null && answer="yes"
      break
    fi
  done

  echo "answer"
}
