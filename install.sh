#!/bin/bash
set -e # crash if any errors along the way
salt=$RANDOM
stat $HOME/.vim > /dev/null # make sure .vim exists. We do this bc the mkdir line might accidentally make it and get us confused
mkdir -p $HOME/.vim/old/ # -p so it won't fail if old/ already exists

echo mv $HOME/.vimrc $HOME/.vim/old/vimrc.old_$salt
mv $HOME/.vimrc $HOME/.vim/old/vimrc.old_$salt

echo ln -s $HOME/.vim/vimrcs/vimrc $HOME/.vimrc
ln -s $HOME/.vim/vimrcs/vimrc $HOME/.vimrc

