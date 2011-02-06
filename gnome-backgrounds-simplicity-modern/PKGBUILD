# Contributor: celticmusicguy (Tony Upton) <celticmusicguy at gmail dot com>
pkgname=gnome-backgrounds-simplicity-modern
pkgver=1
pkgrel=1
pkgdesc="Modern wallpapers collection from the simplicity-desktop-theme site"
arch=(i686 x86_64)
makedepends=()
url="http://code.google.com/p/simplicity-desktop-theme"
license=(LGPL)
source=(http://simplicity-desktop-theme.googlecode.com/files/Modern-Wallpapers.tar.bz2)
md5sums=('8a281b459cd0fa5077bcb8aa4df032d5')

build() {

# Copy images:
local pkgdir=$startdir/pkg
local bgdir=/usr/share/pixmaps/backgrounds/Simplicity/Modern/
local dstdir="${pkgdir}${bgdir}"
install -d $dstdir
install -m644 $startdir/src/Modern/* $dstdir

# Create GNOME configuration xml file:
install -d $pkgdir/usr/share/gnome-background-properties/
local xmlfilename=$pkgdir/usr/share/gnome-background-properties/Simplicity-Modern.xml

cat > $xmlfilename <<END-OF-MESSAGE
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
<wallpapers>
END-OF-MESSAGE

cd $dstdir
for i in *;
do
local name=${i%.*}
name=${name//-/ }
name=${name//_/ }
cat >> $xmlfilename <<END-OF-MESSAGE
    <wallpaper deleted="false">
	<name>${name}</name>
	<filename>$bgdir/$i</filename>
	<options>zoom</options>
    </wallpaper>
END-OF-MESSAGE

done

cat >> $xmlfilename <<END-OF-MESSAGE
</wallpapers>
END-OF-MESSAGE

}

