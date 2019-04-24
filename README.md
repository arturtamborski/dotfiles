# dotfiles

Here are some of my dotfiles.
There's not much of them because I'm still working on a good
way to clear them up and upload in a reasonable way that will
work nicely without using symlinks and tons of hidden files.

# installation
Once there was a script that was supposed to do it but it wasn't really
working so i deleted it and now you have to do it by yourself.

The simplest solution would be to copy these dirs to `~/.config/`
and link `.zshrc` and `.vimrc` there somehow:

```
  # it should look like that
  ~/.zshrc -> ~/.config/zsh/zshrc
  ~/.vimrc -> ~/.config/vim/vimrc
  ~/.vim   -> ~/.config/vim/
```

but the better solution would be to just copy the parts that 
are are really usefull to you, because you shouldn't really just
copy dotfiles end expect them to work for you.

Dotfiles are personal thing. They are your settings. You
should configure them for yourself which unfortunately means
that you have to spend some time with them instead of copying them
blindly from some public repos such as this.

## vim

```
# Run this command
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Open up Vim
vim

# In vim, run this command
:BundleInstall
```


# testing
install vagrant, use below commands

```
# spin up new testing vm
vagrant up

# apply changes
vagrant provision

# apply changes when above fails
vagrant reload --provision

# remove vm
vagrant destroy
```
