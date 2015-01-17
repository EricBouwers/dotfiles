This repository contains my personal dotfiles for working with [Bash](http://en.wikipedia.org/wiki/Bash_(Unix_shell)) and [Vim](http://www.vim.org/). 
By using [Homebrew](http://brew.sh/), [Homebrew cask](http://caskroom.io/) and [npm](https://www.npmjs.com/) everything is 
conveniently versioned on-line and scripted such that a fresh install is just one command away. 

While looking for a way to easily distribute my `.vimrc` to different systems I ran into the 
[dotfiles repository of iheitlager](https://github.com/iheitlager/dotfiles), 
which gave me a first insight into the wondrous world of [.dotfiles](https://dotfiles.github.io/).

This set-up modified versions of the scripts from [iheitlager](https://github.com/iheitlager/dotfiles), mainly some renamings,
placing some functionality in other places, and reducing the need for `sudo`.

## Install

To install my exact configuration execute the following commands:

```sh
git clone https://github.com/EricBouwers/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./bootstrap
```

The following commands (located in 'bin') need to be run every now and then to stay up to date:
* `process_brew_packages` to upgrade [Homebrew](http://brew.sh/) packages
* `process_npm_packages` to upgrade [npm](https://www.npmjs.com/) packages
These scripts can be run separately, or by simply typing `dot`.

If you want to create repository for your own dotfiles with a similar set-up you probably want to copy the basic structure from 
the [dotfiles-skeleton branch][1] and add your own specific configuration.

## Project setup

The overall structure follows the structure of [iheitlager](https://github.com/iheitlager/dotfiles) and [holman](https://github.com/holman/dotfiles). 
Important things to note is that the set-up revolves around *topics*, where each topic can contain different *components*.

### Topics

Everything is configured and tweaked within `~/.dotfiles`. The actual dotfiles are symlinked from this folder during the bootstrap.
This should remain on your system, and offers one place for versioning of your dotfiles, and for example allows .ssh to be excluded.
Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put files in there. 
The complete dotfiles system consists of install time and runtime parts, in total four parts:
- symlinks to dotfiles
- topical extensions to be loaded by `.bash_profile`
- topical brew based installers during `script\bootstrap` (run these with `process_brew_files`)
- topical installers which run during `bootstrap`

### Components

There's a few special files in the hierarchy.

- **bin/**: `bin/` will get added to your `$PATH` by `.bash_profile` and anything in there will be made available everywhere.
- **topic/bash_aliases**: Any file named `bash_aliases` is loaded by `.bash_profile` and provides aliases available in your shell
- **topic/bash_env**: Any file named `bash_env` is loaded by `.bash_profile` and provides environment variables available in your shell
- **topic/bash_completion**: Any file named `bash_completion` is loaded by `.bash_profile`, is supposed to contain completion statements and is available in your shell
- **topic/brew_packages**: Any file named `brew_packages` is executed when running `process_brew_files`, this provides a way to create [Homebrew](http://brew.sh/) based installers. 
- **topic/install.sh**: Any file named `install.sh` is executed when running `bootstrap`, this provides a way to create topical installers
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is such that you can keep all of those versioned in your dotfiles directory, 
  but still keep those autoloaded files in your home directory. These files get
  symlinked in when you run `bootstrap`.

Do not forget to never checkin secrets in any of these files, use ~/.localrc for this (sourced by `.bash_profile`)

## Credits
- General Bash specific set-up was taken from https://github.com/iheitlager/dotfiles
- Main inspiration originally comes from https://github.com/holman/dotfiles
- More about the dotfile stuff: https://dotfiles.github.io/
- Get more inspiration here: http://www.dotfiles.org/
- Solarized theme made by http://ethanschoonover.com/solarized

[1]: https://github.com/EricBouwers/dotfiles/tree/dotfiles-skeleton 
