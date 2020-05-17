# Bookmark for Bash

#### Description
Bookmark for Bash environment

Support add, remove, view operation, and auto completion feature

#### Installation

1. copy bm.bash to $HOME directory ``` cp bm.bash ~/bm.bash ```
2. Rename bm.bash to .bm.bash as a hidden file
3. Add below code to the end of the .bashrc file
```
[ -f ~/.bm.bash ] && source .bm.bash
```
4. Run source ~/.bashrc or reboot bash terminal

Note: the script will automatically create .bms file in the home directory

#### Instructions

1. *bm <bookmark name>:* Add current directory to the bookmark
2. *bj <bookmark name>:* Jump to the bookmark with the name
3. *bl:*                 List the bookmarks
4. *bd <bookmark name>:* Remove the bookmark with the name

#### Contribution

