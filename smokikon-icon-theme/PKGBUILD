# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=smokikon-icon-theme
pkgver=0.9
pkgrel=1
pkgdesc="A dark icon theme in grayscale."
url="http://gnome-look.org/content/show.php/Smokikon?content=90577"
license=('GPL')
arch=('i686' 'x86_64')
source=(http://gnome-look.org/CONTENT/content-files/90577-Smokikon_v09.tar.gz)
md5sums=('2da9b9ebf1228fbc00e0bc1164a25add')

package() {
	cd $srcdir/

	mkdir -p $pkgdir/usr/share/icons/
	cp -r Smokikon_v09 $pkgdir/usr/share/icons/smokikon
}

