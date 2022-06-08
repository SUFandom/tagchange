#!/bin/bash
##Caching
TITLE="TagChange"
MENU="Menu"
INPUT="Give a Name"
RESTORE="Revert any Changes"
SPLASH="TagChange v.0.1"
##Exit Operations
: ${DIALOG_OK=0}
: ${DIALOG_CANCEL=1}
: ${DIALOG_ESC=255}


##Color and Styles, etc
red_f=$(tput setaf 1)
red_b=$(tput setab 1)
green_f=$(tput setaf 2)
green_b=$(tput setab 2)
yellow_f=$(tput setaf 3)
yellow_b=$(tput setab 3)
blue_f=$(tput setaf 4)
blue_b=$(tput setab 4)
magenta_f=$(tput setaf 5)
magenta_b=$(tput setab 5)
cyan_f=$(tput setaf 6)
cyan_b=$(tput setab 6)
white_f=$(tput setaf 7)
white_b=$(tput setab 7)

#TextForm
bold=$(tput bold)
uline=$(tput smul)
blink=$(tput blink)
reverse=$(tput rev)
standout=$(tput smso)
norm=$(tput cnorm)
colnorm=$(tput sgr0)

##Code
dialog --backtitle "$SPLASH" --title "Repairing" --infobox "Repairing" 0 0
sleep 5
  cp bashrc/bash.bashrc $PREFIX/etc/bash.bashrc
  echo "Done"
  sleep 2
  bash main.sh
