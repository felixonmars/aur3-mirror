# Contributor: celticmusicguy (Tony Upton) <celticmusicguy at gmail dot com>
pkgname=gnome-backgrounds-simplicity-nature
pkgver=1
pkgrel=1
pkgdesc="Nature wallpapers collection from the simplicity-desktop-theme site"
arch=(i686 x86_64)
makedepends=()
url="http://code.google.com/p/simplicity-desktop-theme"
license=(LGPL)
source=(http://simplicity-desktop-theme.googlecode.com/files/Nature-Wallpapers.tar.bz2)
md5sums=('cfebffdde30f7219ff19a07e12f76575')

build() {

# Copy images:
local pkgdir=$startdir/pkg
local bgdir=/usr/share/pixmaps/backgrounds/Simplicity/Nature/
local dstdir="${pkgdir}${bgdir}"
install -d $dstdir
install -m644 $startdir/src/Nature/* $dstdir

# Create GNOME configuration xml file:
install -d $pkgdir/usr/share/gnome-background-properties/
local xmlfilename=$pkgdir/usr/share/gnome-background-properties/Simplicity-Nature.xml

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

