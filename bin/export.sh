#!/bin/bash
#
# Export variables to global enviroment.
#
# Okay, this one is tricky - in order for this to work you need to execute it each
# time in shell by typing `source /path/to/this/file/` which sucks.
# But you can make it better by adding this line to your .bashrc/.zshrc/.shellrc
#
# source ~/dotfiles/.bin/export.sh
#
# It will force ZSH to look for config files in non-default directory.
# This solution still sucks, but its better than symlinks from dotfiles to home 
# directory, or polluting global dotfiles in /etc/.
# 

# path to dotfiles directory
dot="$HOME/dotfiles"

# -------------------------------------------------------------------- vim --- #
export VIMINIT="$dot/.vim/"
export MYVIMRC="$dot/.vim/vimrc"

# -------------------------------------------------------------------- zsh --- #
export ZDOTDIR='$dot/.zsh'
