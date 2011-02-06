#!/bin/sh
# This script is a modified from http://aur.archlinux.org/packages.php?ID=22383
# This script fixes Go-oo in dark themes. Go-oo will sometimes switch to a high
# contrast mode, making it look bad and be pretty unusable. USE AT OWN RISK! Tested in Arch Linux only.
# Requires the Clearlooks theme, found in the 'gtk-engines' package in [extra] in Arch
# Modified from this guide: http://www.rebelzero.com/fixes/openofficeorg-dark-theme-workaround-with-ubuntu-804
# You will probably need to re-run this script each time Go-oo gets updated

# Set binary location here:
# In Arch and probably other distros too: /usr/lib/go-openoffice/program/
# In Ubuntu and other distros too: /usr/lib/openoffice/program/
# If the script fails, make sure this is correctly set, with a slash at the end
GO_OO_INSTALLATION_DIR=/usr/lib/go-openoffice/program/

# Change to OpenOffice.org installation directory
cd ${GO_OO_INSTALLATION_DIR}

# Rename the old launch script
echo 'Renaming old launch script...'
if [ -f "soffice.bak" ]; then echo "..."
else cp soffice soffice.bak; fi

mv soffice soffice1

# Create new launch script
echo 'Creating new launch script...'
echo '#!/bin/sh' > soffice
echo env GTK2_RC_FILES=/usr/share/themes/Clearlooks/gtk-2.0/gtkrc env OOO_FORCE_DESKTOP=gnome ${GO_OO_INSTALLATION_DIR}soffice1 \"\$\@\" >> soffice

# Make the new script executable
echo 'Giving new script executable permissions...'
chmod +x soffice

# Rename the binary so it will correctly launch
echo 'Renaming binary for compatibility...'
if [ -f "soffice.bin" ]; then mv soffice.bin soffice1.bin; fi

echo 'Complete :-)'
