# Maintainer: Josip <josipponjavic@gmail.com>

pkgname=meliae-dust
pkgver=0.1
pkgrel=1
pkgdesc="Meliae Dust - an icon theme based on the lovely Meliae, but with Dust folders all over the place. "
arch=('any')
url="http://www.gnome-look.org/content/show.php/Meliae-Dust?content=93759"
license=('GPL')
source=(http://www.css-petals.net/edit/data/File/Meliae-Dust.tar.gz)
md5sums=('5733172729ebf2086da44fe21e7b5a6d')

build() {
	cd $startdir/src/
	mkdir -p $startdir/pkg/usr/share/icons/
	cp -r "Meliae-Dust" $startdir/pkg/usr/share/icons/
}

