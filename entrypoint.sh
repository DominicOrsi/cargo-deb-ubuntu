#!/bin/sh -l
set -eux

# Linking root cargo dir to home dir of github action
# $HOME(/github/home)
ln -s /root/.cargo $HOME/.cargo
ln -s /root/.rustup $HOME/.rustup

# Return to the repo root
cd $GITHUB_WORKSPACE
# Run command
sh -c "$*"
chmod 0777 ./target
# Move debain packages to root
mv ./target/*/debian/* $GITHUB_WORKSPACE 