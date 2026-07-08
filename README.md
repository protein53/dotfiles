# dotfiles
All of my dot files
These dot files are intended to be 'installed' using 'save_backup_then_stow',
which uses 'stow' command under the hood. If there are existing files, it
will first move them in ~/origdot, so that they may be restored later.
1. git clone https://github.com/protein53/dotfiles ~/dotfiles
2. cd ~/dotfiles
3. xonsh save_backup_then_stow    --> all your dot files are now installed
4. use the system and when you are done and would like to restore the original dot files,
5. cd ~/origdot
6. xonsh unlink_then_restore   --> original dot files are now linked
7. Say, you want to revert to your own dotfiles again? - Just repeat steps 2 and 3 above
   

