#!/usr/bin/env bash

# Run this script to build and install the Lean Game Maker
source virtualenvwrapper.sh
mkvirtualenv --python=$HOME/.pyenv/versions/3.7.2/bin/python lean_env
cd src/interactive_interface
npm install .
./node_modules/.bin/webpack --mode=production
cd ../..
deactivate 
pip3 install -e .