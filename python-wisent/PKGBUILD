# Contributor: Paul Colomiets pc at gafol.net

pkgname=python-wisent
pkgver=0.6
pkgrel=1
pkgdesc=""
pkgdesc="A parser-generator written in python. Implements LR(1) parser, and partially LALR(1)."
arch=('i686' 'x86_64')
url="http://seehuhn.de/pages/wisent"
license=('GPL')
makedepends=()
source=(http://seehuhn.de/media/programs/wisent-$pkgver.tar.gz)
md5sums=('45db5d2cff70a264ce353a7ffe578af2')

build() {
	cd $srcdir/wisent-$pkgver
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$pkgdir install || return 1
}

