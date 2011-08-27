#!/bin/sh
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# This script fixes OpenOffice.org in dark themes. OpenOffice.org will sometimes switch to a high
# contrast mode, making it look bad and be pretty unusable. USE AT OWN RISK! Tested in Arch Linux only.
# Requires the Clearlooks theme, found in the 'gtk-engines' package in [extra] in Arch
# Modified from this guide: http://www.rebelzero.com/fixes/openofficeorg-dark-theme-workaround-with-ubuntu-804
# You will probably need to re-run this script each time OpenOffice gets updated

# Set binary location here:
# For standard OpenOffice: /usr/lib/openoffice/program/
# For Libreoffice: /usr/lib/libreoffice/program/
# If the script fails, make sure this is correctly set, with a slash at the end
OOO_INSTALLATION_DIR=/usr/lib/libreoffice/program/

# Uninstall
if [ "$1" = "--uninstall" ]; then
	echo 'Uninstalling...'
	cd ${OOO_INSTALLATION_DIR}
	rm soffice
	mv soffice1 soffice
#	mv soffice1.bin soffice.bin
	exit
fi

# Change to OpenOffice.org installation directory
cd ${OOO_INSTALLATION_DIR}

# Rename the old launch script
echo 'Renaming old launch script...'
mv soffice soffice1

# Create new launch script
echo 'Creating new launch script...'
echo '#!/bin/sh' > soffice
echo env GTK2_RC_FILES=/usr/share/themes/Clearlooks/gtk-2.0/gtkrc env OOO_FORCE_DESKTOP=gnome ${OOO_INSTALLATION_DIR}soffice1 \"\$\@\" >> soffice

# Make the new script executable
echo 'Giving new script executable permissions...'
chmod 755 soffice

# Rename the binary so it will correctly launch
# echo 'Renaming binary for compatibility...'
# This line seems to screw up with newer versions of Libreoffice and is no longer needed, may still be needed on other versions, not sure
# mv soffice.bin soffice1.bin

echo 'Complete :)'
