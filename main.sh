#!/bin/bash
##Caching
TITLE="TagChange"
MENU="Menu"
INPUT="Give a Name"
RESTORE="Revert any Changes"
SPLASH="TagChange v.0.1"

## Exit
: ${DIALOG_OK=0}
: ${DIALOG_CANCEL=1}
: ${DIALOG_ESC=255}


## Main

dialog --backtitle "$TITLE" --infobox "$SPLASH, By SUFandom" 0 0
sleep 5

if ( dialog --backtitle "$TITLE" --title "Warning" --yes-label "Yes, i do" --no-label "Abort" --yesno "This Script is modifying a Sensitive asset in $PREFIX/etc, which can pose danger if this script is not really effective because you didn't execute chmod on it or other issues like, you use ZSH." 0 0 )
then
   echo ""
else
   exit 1
fi
exec 3>&1
menu=$( dialog \
  --backtitle "$SPLASH" \
  --title "$TITLE $MENU" \
  --menu "Main menu of the script, Pick now." 25 45 5 \
  "Change" "Change the User Mark" \
  "Restore" "Restore any Changes" \
  "Repair" "Fix by Reverting to Original " \
  "Help" "Help Page" \
  "About" "About page" \
  2>&1 1>&3 \
  )
exitvar=$?
exec 3>&-
##Function
function exitcode() {
  dialog --backtitle "$SPLASH" --infobox "Exiting" 0 0
  sleep 2
  exit 1
}
function wiz() {
  dialog --backtitle "$SPLASH" --title "Help" --textbox src/help-txt.txt 25 55
 bash main.sh
}
function whome() {
  dialog --backtitle "$SPLASH" --title "About" --msgbox "Version 0.1, From Github" 0 0
  bash main.sh
}
case $exitvar in
 $DIALOG_CANCEL)
    exitcode;;
 $DIALOG_ESC)
    exitcode;;
esac
case $menu in
 Change)
bash input.sh;;
 Restore)
  bash restore.sh;;
 Repair)
 bash repair.sh;;
 Help)
 wiz;;
 About)
 whome;;
esac
