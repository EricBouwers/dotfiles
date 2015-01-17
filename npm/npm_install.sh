#!/usr/bin/env bash

if ! test $(which npm)
then 
  install_or_upgrade_brew_package node
fi

npm install -g npm@latest
