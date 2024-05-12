#!/bin/bash

clean_up() {
  cd ../..
  rm -rf setup
}

mkdir setup
cd setup

curl -L https://github.com/jeroenptrs/mac-setup/tarball/main | tar zx
cd $(ls -d */|head -n 1)
./setup-mac.sh

read -p "Do you want to clean up the project? (y/n) " -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]
then
  clean_up
fi
