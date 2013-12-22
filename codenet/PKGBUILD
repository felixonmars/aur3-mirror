# Maintainer: lobotomius <lobotomius at gmail dot com>
pkgname=codenet
pkgver=0.4
pkgrel=1
epoch=
pkgdesc="final replay codenet server"
arch=("i686" "x86_64")
url="http://www.oxyron.de/html/codenet.html"
license=('GPL')
source=("http://www.oxyron.de/storage/codenet04src.zip")
md5sums=('8305d89f497a5d39c6ae9b3f739bf44d')

build() {
	cd "$srcdir/"
	make
}

package() {
	cd "$srcdir/"
	mkdir -p "$pkgdir/usr/bin"
	install -m 755 codenet "$pkgdir/usr/bin"
}
