#!/bin/bash

echo "Starting bootstrap"

if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

PACKAGES=(
#    ffmpeg
#    git
#    imagemagick@6
#    markdown
#    node
#    pandoc
#    postgresql
    python3
#    regex-opt
    speedtest-cli
    tree
#    vim
#    wakeonlan
    wget
)

echo "Intalling packages..."
brew install ${PACKAGES[@]}

echo "Cleaning up..."
brew cleanup

echo "Installing casks..."
# brew install cask

CASKS=(
#    1password
#    1password-cli
#    alfred
#    balenaetcher
#    commander-one
#    crossover
#    devonagent
#    devonthink
#    dropbox
#    gimp
#    github
    google-chrome
    iterm2
    jupyter-notebook-ql
#    keyboard-maestro
#    macvim
#    obsidian
#    overdrive-media-console
#    script-debugger
#    scrivener
#    snagit
#    soundcleod
#    spamsieve
#    virtualbox
#    zettlr
)

echo "Installing cask apps..."
brew install --cask ${CASKS[@]}

echo "Installing Python packages..."
PYTHON_PACKAGES=(
    ipython
    virtualenv
    virtualenvwrapper
)

sudo pip3 install ${PYTHON_PACKAGES[@]}

echo "Bootstrap complete"

