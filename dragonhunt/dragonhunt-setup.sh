#!/bin/sh

echo "Creating $HOME/.dragonhunt directory..."
mkdir $HOME/.dragonhunt

echo "Copying settings.txt to $HOME/.dragonhunt..."
cp -f /usr/share/doc/dragonhunt/settings.txt $HOME/.dragonhunt/

echo "Creating directories for saved games..."
mkdir -p $HOME/.dragonhunt/saves/../modules/{"Dragon Hunt","Dark Ages"}/saves

echo "Done."
