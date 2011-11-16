# Maintainer: Thomas Oster <thomas.oster@rwth-aachen.de>

pkgname=gnome-theme-heavymetal
pkgver=0.48
pkgrel=1
pkgdesc="Heavy metal theme for gnome-shell, gtk2 gtk3 and metacity."
url="http://samriggs.deviantart.com/gallery/#/d48lbtr"
arch=('any')
license=('GPL3')
makedepends=('unzip')
depends=('gtk-engine-murrine' 'gdk-pixbuf2' 'gtk-engine-equinox')
source=(http://www.deviantart.com/download/256296735/heavy_metal_by_samriggs-d48lbtr.zip)
md5sums=('e62868a08ad65800e21b140893ff05f6')
_destdir=$pkgdir/usr/share/themes

package() {
	cd $srcdir
	mkdir -p $_destdir
	msg2 "Installing files..."
	cp -r Heavy\ Metal $_destdir
	msg2 "Setting rights..."
	# Ensure directories are accessible by anyone:
	find . -type d -exec chmod 755 '{}' \;
	chmod go+r $_destdir -R
}

