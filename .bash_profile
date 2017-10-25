# aliases
alias bp="vim ~/dotfiles/.bash_profile"
alias vimrc="vim ~/.vimrc"
#git aliases
alias gs="git status"
alias gc="git checkout"
alias gpp="git push"
alias gp="git pull"
alias g="git"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

alias makecoffee="coffeetags --append --include-vars --recursive"
alias maketags="ctags -R --exclude=.git --exclude=node_modules --exclude=test"
alias be="bundle exec"

# Git branch in prompt.
parse_git_branch() {
  if `git rev-parse --is-inside-work-tree 2> /dev/null`; then
    git branch | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
  fi
}

parse_repo() {
  if `git rev-parse --is-inside-work-tree 2> /dev/null`; then
    basename `git rev-parse --show-toplevel`
  fi
}

show_directory() {
  REPO=$(parse_repo)
  LEVEL=$(basename $PWD)
  if [ "$LOGNAME" == "$LEVEL" ]; then
    echo "~"
  elif [ "$REPO" != "$LEVEL" ]; then
    echo $LEVEL
  fi
}

add() {
  script="$(pwd)/$1"
  ln -s $script $HOME/.cmds/$1
}

export PS1="\[\033[32m\]\$(parse_git_branch)\[\033[33m\] \$(parse_repo)\[\033[00m\] \$(show_directory):  "
