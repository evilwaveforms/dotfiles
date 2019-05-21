#!/bin/bash
###
# creates symlinks from ~ to dotfiles in ~/dotfiles
###

dir=~/dotfiles              # dotfiles directory
olddir=~/dotfiles_old       # backup directory for old dotfiles
files="bashrc vimrc vim Xresources xinitrc xbindkeysrc compton.conf i3 i3blocks.conf zathura" # files/folders to symlink

# create backup directory for old dotfiles
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# backup existing files, then create symlinks
# NOTE: replaces existing files/folders in ~/dotfiles_old
for file in $files; do
	echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
