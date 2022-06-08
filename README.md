# TagChange

### A Tag Changer to change your boring `~$` around

**Badges**

![version](https://img.shields.io/badge/version-0.1-red?style=flat-square&logo=appveyor) ![status](https://img.shields.io/badge/status-stable%20and%20passed-green?style=flat-square&logo=appveyor) ![license](https://img.shields.io/badge/license-GPL3-lightgrey?style=flat-square&logo=appveyor)


*See: html-help in directory for the Wiki on how to use the script in detail..*

[Wiki](/html-help/help.html) (if not working, just manually check the directory )

This script aims to change the `~$` neatly without issues and errors.

Any problems should bd reported under Issues tab

Code to run
```
chmod +x *.sh && bash boot.sh
```

### Permissions

These are the following list that this script needs 

- Read and Write files and/or Directory 

   to modify and remove things in these directories:
   
  - $HOME/
  - $PREFIX/etc
   
- Use APT service
 
  to install package(s) of the Following:

  - ncurses-utils (for tput)

- ⚠️ Modify Termux-Level Files

   Affected Files are:
   
   - bash.bashrc in `$PREFIX/etc`

- Use Chmod Process to Leverage the permissions.

- ⚠️ Remove Termux-Level Files

   The following files will be affected are:
   
   - bash.bashrc in `$PREFIX/etc`

*If you don't like the permissions it wants, you can avoid using it*
