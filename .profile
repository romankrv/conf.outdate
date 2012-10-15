#!/bin/bash

alias r="reset"
alias ll="ls -Al"


export PS1="\[\033[1;34m\][\W]$\[\033[0m\] "

# Virtualenv automaticaly activation on entry to folder
 # Create in $HOME folder with name ".envs"
 # in folder of project to create file with name ".venv" and 
 # type VIRTUALENV_PATH=$HOME/.envs/myprojet_env there
 #  e.g. VIRTUALENV_PATH=$HOME/.envs/myproject_env
 #  cd `$HOME/.envs` and create virtualenv myproject_env


PREVPWD=`pwd`
PREVENV_PATH=
PREV_PS1=
PREV_PATH=

handle_virtualenv(){
  if [ "$PWD" != "$PREVPWD" ]; then
    PREVPWD="$PWD";
    if [ -n "$PREVENV_PATH" ]; then
      if [ "`echo "$PWD" | grep -c $PREVENV_PATH`" = "0"  ]; then
         source $PREVENV_PATH/.venv
         echo "> Virtualenv `basename $VIRTUALENV_PATH` deactivated"
         PS1=$PREV_PS1
         PATH=$PREV_PATH
         PREVENV_PATH=
      fi
    fi
    # activate virtualenv dynamically
    if [ -e "$PWD/.venv" ] && [ "$PWD" != "$PREVENV_PATH" ]; then
      PREV_PS1="$PS1"
      PREV_PATH="$PATH"
      PREVENV_PATH="$PWD"
      source $PWD/.venv
      source $VIRTUALENV_PATH/bin/activate
      echo "> Virtualenv `basename $VIRTUALENV_PATH` activated"
    fi
  fi
}
export PROMPT_COMMAND=handle_virtualenv


if [ `uname` = "Darwin" ]; then
    if  [ `which brew` ]; then
       # set homebrew autocomletion on tab
       source `brew --prefix`/Library/Contributions/brew_bash_completion.sh
    fi
fi

if [ `which rvm` ] ; then
   # This loads RVM into a shell session.
    [[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
    [[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion
    PATH=$PATH:/opt/macports/bin:/opt/macports/sbin
fi