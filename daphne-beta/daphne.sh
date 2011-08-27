#!/bin/sh

if [ ! -e $HOME/.daphne ]; then
  echo ""
  echo "Running Daphne for the first time..."
  echo "Copy your framefiles, mpegs, roms to the corresponding folders"
  echo "within $HOME/.daphne and reference them from the command-line."
  echo "Ex: daphne lair vldp -framefile '~/.daphne/framefile/lair.txt'"
  echo ""
  mkdir -p $HOME/.daphne/{framefile,mpegs,roms}
  cd /opt/daphne-beta

  # Point to the linked libs that user may not have
  export LD_LIBRARY_PATH=./lib

  # Run the executable
  ./daphne "$@"
else
  cd /opt/daphne-beta

  # Point to the linked libs that user may not have
  export LD_LIBRARY_PATH=./lib

  # Run the executable
  ./daphne "$@"
fi
