#!/bin/bash

if test -f $HOME/.bash_profile; then
  echo "source $PWD/.bash_profile.local" >> $HOME/.bash_profile
  echo "'source $PWD/.bash_profile.local' >> $HOME/.bash_profile"
else
  ln -s $PWD/.bash_profile.local $HOME/.bash_profile
fi

if test -f $HOME/.vimrc; then
  echo "source $PWD/.vimrc" >> $HOME/.vimrc
  echo "'source $PWD/.vimrc' >> $HOME/.vimrc"
else
  ln -s $PWD/.vimrc $HOME/.vimrc
fi

if test -f $HOME/.tmux.conf; then
  echo "source $PWD/.tmux.conf" >> $HOME/.tmux.conf
  echo "'source $PWD/.tmux.conf' >> $HOME/.tmux.conf"
else
  ln -s $PWD/.vimrc $HOME/.tmux.conf
fi
