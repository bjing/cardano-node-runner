#!/bin/bash

# Bootstrap dirs
echo "Bootstraping environment directories..."
sh scripts/bootstrap_dirs.sh
echo 

# Cardano node binaries
mkdir bin/
# TBD

#### Create symlinks ###
echo 'Symlinking scripts/cardano.env to $HOME/.bash_cardano'
ln -sf $PWD/scripts/cardano.env $HOME/.bash_cardano
echo

# Creating symlinks for utility scripts
echo 'Creating $HOME/bin if it does not exist'
mkdir -p $HOME/bin
echo

echo 'Adding $HOME/bin to $PATH in $HOME/.bashrc'
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
echo

echo 'Adding cardano-node-runner bin directory to $PATH in $HOME/.bashrc'
s="export PATH=\"$PWD/bin:"
s+='$PATH"'
echo $s >> ~/.bashrc
echo

FILES_TO_SYMLINK="query-cardano-node.sh start-cardano-node start-ogmios.sh"
for FILE in $FILES_TO_SYMLINK; do
  echo "Symlinking 'scripts/$FILE' to '$HOME/bin/$FILE'"
  ln -sf $PWD/scripts/$FILE $HOME/bin/$FILE
done;
echo

echo "Setup complete. Please source ~/.bashrc for changes to take effect"
echo "Enjoy your new cardano node setup!"
