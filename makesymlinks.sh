#!/bin/bash
# creates symlinks from ~ to dotfiles in ~/dotfiles

dir=~/dotfiles              # dotfiles directory
olddir=~/dotfiles_old       # backup directory for old dotfiles
files="bashrc zshrc vimrc Xresources xinitrc xbindkeysrc compton.conf i3 i3blocks.conf tmux.conf ncmpcpp alacritty.toml vimspector.gadgets.json"
cdirs="zathura nvim helix kitty rmpc" # ~/.config/x

echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

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

for cdir in $cdirs; do
    mv ~/.config/$cdir ~/dotfiles_old/
    ln -s $dir/$cdir ~/.config/$cdir
done
