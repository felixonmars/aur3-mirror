#!/bin/bash

package=$(basename $0)

mkdir -p $HOME/."$package" || exit 1
export WINEPREFIX="$HOME/."$package"/wine"
wine /usr/share/"$package"/"$package".exe $*
