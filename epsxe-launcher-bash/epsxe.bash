#!/bin/bash
#
# epsxe.bash -- an ePSXe wrapper script
#
# This script will setup an environment for ePSXe 1.5.2 and 1.6.0 and run the
# emulator in it.

# The directory where the configuration will be stored.
DOTDIR="$HOME/.epsxe"

# The full path -- including the filename -- to the ePSXe 1.6.0 executable.
EPSXE="/opt/epsxe/epsxe"

# The full path -- including the filename -- to the ePSXe 1.5.2 executable.
EPSXE_OLD="/opt/epsxe/epsxe-1.5.2"

# The full path -- including the filename -- to keycodes.lst
KEYFILE="/opt/epsxe/keycodes.lst"

BIOSDIRS=("/opt/epsxe/bios" "/usr/lib/games/psemu" "/usr/lib/psemu")
BIOSPATTERN="*.[Bb][Ii][Nn]"

PLUGINDIRS=("/opt/epsxe/plugins" "/usr/lib/games/psemu" "/usr/lib/psemu")
PLUGINPATTERN="lib*.so*"

CFGDIRS=("/opt/epsxe/cfg" "/usr/lib/games/psemu" "/usr/lib/psemu")
CFGPATTERN="cfg*"

# Array of filenames of plugins which will never work with ePSXe but with other
# PSX emulators.  To allow to run everything side by side smoothly you can
# blacklist them here.
if [ -z "$EPSXE_BLACKLIST"]; then
    EPSXE_BLACKLIST=("libcdrmooby*.so*" "libDFIso*.so*")
fi

mkdir -p "$DOTDIR"
cd "$DOTDIR"
mkdir -p bios plugins cfg memcards snap sstates

echo "Linking executables..."
ln -fsv "$EPSXE" epsxe-160
ln -fsv "$EPSXE_OLD" epsxe-152

echo "Linking keycode file..."
ln -fsv "$KEYFILE" keycodes.lst

echo "Linking BIOS files..."
for dir in ${BIOSDIRS[@]}; do
    ln -fsv $dir/$BIOSPATTERN -t bios
done

echo "Linking plugins..."
for dir in ${PLUGINDIRS[@]}; do
    ln -fsv $dir/$PLUGINPATTERN -t plugins
done

echo "Linking configuration utilities..."
for dir in ${CFGDIRS[@]}; do
    ln -fsv $dir/$CFGPATTERN -t cfg
done

echo "Cleaning up..."
find -P bios cfg plugins -type l | while read link; do
    [ -e "$link" ] || rm -fv "$link"
done
for plugin in ${EPSXE_BLACKLIST[@]}; do
    rm -fv plugins/$plugin
done

cd - > /dev/null

case "$1" in
    ("-old")
        shift
        exec "$DOTDIR/epsxe-152" "$@"
        ;;
    (*)
        exec "$DOTDIR/epsxe-160" "$@"
        ;;
esac

