#!/usr/bin/env bash

if [ ! -f ~/.localrc ];
then
    echo "  Creating an empty ~/.localrc, put super secret stuff here!"
    echo > ~/.localrc
fi
chmod og-r ~/.localrc


if test $(which brew)
then 
   
  bash_path=$(brew --prefix)/bin/bash 
  if [ -x $bash_path ] && [ $SHELL != "$bash_path" ]
  then
    echo -e "  Found homebrew bash, setting this one as default,\n"
    echo -e "  you probably need to type your password twice.\n"
    sudo bash -c "echo $bash_path >> /private/etc/shells"
    chsh -s $bash_path 
  fi
  unset bash_path
fi

