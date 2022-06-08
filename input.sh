#!/bin/bash
##Cache
TITLE="TagChange"
MENU="Menu"
INPUT="Give a Name"
RESTORE="Revert any Changes"
SPLASH="TagChange v.0.1"
## Color and others
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


##Main
 filerc=$PREFIX/etc/bash.bashrc
  tput cnorm
 inps=$( dialog \
 --backtitle "$SPLASH" \
 --title "$INPUT" \
 --inputbox "Enter the text you want to add (The '\w' Serves as Directory Header, See GNU Bash wiki for more). To check if its working, you can open Session Terminal to see. You can add Color values too if you want." 0 0 "\w " \
 3>&1 1>&2 2>&3 3>&- \
 )
 exitvalue=$?
 sleep 5
 case $exitvalue in
 $DIALOG_OK)
 if [ -f "$filerc" ]
  then
  echo "Preparing to modify"
  sleep 3
  mkdir $HOME/.tagchange_bash_backup
  cp $filerc $HOME/.tagchange_bash_backup/
  rm -rf "$filerc"
  touch $PREFIX/etc/bash.bashrc
  echo "# Command history tweaks:" >> $filerc
  echo "# - Append history instead of overwriting" >> $filerc
  echo "#   when shell exits." >> $filerc
  echo "# - When using history substitution, do not" >> $filerc
  echo "#   exec command immediately." >> $filerc
  echo "# - Do not save to history commands starting" >> $filerc
  echo "#   with space." >> $filerc
  echo "# - Do not save duplicated commands." >> $filerc
  echo "shopt -s histappend" >> $filerc
  echo "shopt -s histverify" >> $filerc
  echo "export HISTCONTROL=ignoreboth" >> $filerc
  echo "" >> $filerc
  echo "# Modified String Line code by the user using TagChange Script" >> $filerc
  echo "PROMPT_DIRTRIM=2" >> $filerc
  echo "# \w Means Directory Info, the one whos doing ...etc/sys labeling" >> $filerc
  echo "PS1='$inps'" >> $filerc
  echo "" >> $filerc
  echo "# Handles nonexistent commands." >> $filerc
  echo "# If user has entered command which invokes non-available" >> $filerc
  echo "# utility, command-not-found will give a package suggestions." >> $filerc
  echo "if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then" >> $filerc
  echo "    command_not_found_handle() {" >> $filerc
  echo '		/data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"' >> $filerc
  echo "}" >> $filerc
  echo "fi" >> $filerc
  
  echo "Done, using cat to verify"
  sleep 5
  cat $filerc
  sleep 3
  while true ; do
    read -r -p "Did you see a Cat prompt? (Use Y/N, y/n) > " ans
    case $ans in
      [Yy]*) clear ; echo "Great, try to open Session to see, ending while loop.." ; sleep 3 ; break ;; 
      [Nn]*) "$white_b$red_f Hate it or not, Please Clear Data the Termux, although still functional, but command-not-found and history, a terminal function may not work properly (but command-not-found , the one who tends to try to help you what command it is, may no longer work and history may spew and write some unneat commands from your history data instead of filtering it to keep it neat." ; sleep 10 ; exit 1 ;;
      * ) echo "Can you Read? Read the Instructions again" ; sleep 3 ;; 
      esac
  done
  bash main.sh
  else
  clear
  echo "Bash.bashrc not found.. Exiting Abruptly..."
  exit 1
  fi ;;
$DIALOG_CANCEL)
 bash main.sh ;;
 esac
