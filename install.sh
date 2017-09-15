#!/bin/bash

if test -f $HOME/.bash_profile; then
  echo "source $PWD/.bash_profile" >> $HOME/.bash_profile
  echo "'source $PWD/.bash_profile' >> $HOME/.bash_profile"
else
  touch $HOME/.bash_profile
  echo "source $PWD/.bash_profile" >> $HOME/.bash_profile
  echo "'source $PWD/.bash_profile' >> $HOME/.bash_profile"
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
  ln -s $PWD/.tmux.conf $HOME/.tmux.conf
fi

if ! test -f $HOME/.cmds; then
  mkdir $HOME/.cmds
fi
