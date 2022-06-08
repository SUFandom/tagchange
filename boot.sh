#!/bin/bash
##Caching
TITLE="TagChange"
MENU="Menu"
INPUT="Give a Name"
RESTORE="Revert any Changes"
SPLASH="TagChange v.0.1"

## Clear and install
apt-get install ncurses-utils -y >> /dev/null

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

#Others
user=$(whoami)
host=$(uname -n)
opsys=$(uname -o)
machine=$(uname -m)
kernel_nme=$(uname -s)
kernel_rel=$(uname -r)
kernel_ver=$(uname -v)
upt=$(uptime -p)
cal=$(date)


## Init

clear
tput civis
echo "Welcome to TagChange"
sleep 1
echo "You can add your name in the Console.. "
sleep 2
echo "$red_f\Warning, this code is trying to modify Bash, in case if fails, please Alert the Developer, and tell briefly what happened, and also try to Clear Data (You will lose progress but That should revert the Bash to normal." $colnorm
sleep 5
clear
echo "Starting.."
sleep 3

bash main.sh
