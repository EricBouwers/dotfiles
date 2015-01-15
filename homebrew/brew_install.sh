#!/usr/bin/env bash

# Check for Homebrew
if test ! $(which brew)
then

  # we need to sudo for homebrew
  echo -e "\nInstalling homebrew requires a sudo password:\n"
  sudo -v

  echo "  Installing Homebrew in the standard location"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "  Updating Homebrew"
  brew update
fi

if ! brew doctor; then
  echo "\`brew doctor\` failed. Please resolve issues before continuing."
  exit 1
fi

brew cleanup 
