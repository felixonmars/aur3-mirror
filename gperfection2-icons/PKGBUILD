# Maintainer: Alexi Yan <aiezue@gmail.com>

pkgname=gperfection2-icons
pkgver=1.0
pkgrel=2
pkgdesc="GNOME2 icon set based on the default GNOME2 icon set originally designed by Jakub 'Jimmac' Steiner. "
arch=('any')
url="http://lokheed.deviantart.com/art/gperfection-sup2-Icon-Set-18530981"
license=('GPL')
source=(http://fc00.deviantart.net/fs10/f/2006/159/6/d/gperfection2.zip)
md5sums=('2067574DA169C8CD25232FF13920A358')

build() {
	cd $srcdir
	mkdir -p $pkgdir/usr/share/icons/
	cp -r "gperfection2" "$pkgdir/usr/share/icons"
}

