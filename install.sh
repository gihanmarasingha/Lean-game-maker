#!/usr/bin/env bash

## This script installs Lean and the Lean Game Maker

echo "Installing Lean..."
curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh
cd ${HOME}/.elan
chmod u+x env
./env
echo "Lean installed."

# The rest of this is largely drawn from the instructions in https://github.com/mpedramfar/Lean-game-maker/blob/master/INSTALL.md

git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# Now get a few important packages.
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev
export PATH="$HOME/.pyenv/bin:$PATH"
echo "Installing Python. Please wait ..." # Install a local version of Python 3.7.2
pyenv install 3.7.2
echo "Python installed"
sudo apt install python3-pip # Ensure we have pip

# Now we'll set up a virtual environment for compiling the Lean Game Maker. First get things ready.
sudo -H pip3 install virtualenvwrapper


cwd

# Run this script to build and install the Lean Game Maker
source virtualenvwrapper.sh
mkvirtualenv --python=$HOME/.pyenv/versions/3.7.2/bin/python lean_env
cd src/interactive_interface
npm install .
./node_modules/.bin/webpack --mode=production
cd ../..
deactivate 
pip3 install -e .