# Maintainer: Josip <josipponjavic@gmail.com>

pkgname=meliae-icons
pkgver=0.7
pkgrel=1
pkgdesc="Meliae icon theme. (dark & white)"
arch=('any')
url="http://www.gnome-look.org/content/show.php/Meliae?content=88482"
license=('GPL')
source=(http://www.blissclub.it/icons/Meliae.tar.gz
                  http://www.blissclub.it/icons/MeliaeWhite.tar.gz)
md5sums=('e231b0ded8d9693e0620b607df9ef48c'
                       'f7aabd311d65483e1afcc96f06500f52')

build() {
	cd $startdir/src/
	mkdir -p $startdir/pkg/usr/share/icons/
        cp -R "$srcdir/MeliaeWhite" "$pkgdir/usr/share/icons"
        cp -R "$srcdir/Meliae" "$pkgdir/usr/share/icons"
}

