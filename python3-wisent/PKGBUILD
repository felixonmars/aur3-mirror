# Contributor: Paul Colomiets pc at gafol.net, Michael Enßlin, Andre Kupka

pkgname=python3-wisent
pkgver=0.6.2
pkgrel=1
pkgdesc=""
pkgdesc="A parser-generator written in python. Implements LR(1) parser, and partially LALR(1)."
arch=('any')
url="http://seehuhn.de/pages/wisent"
license=('GPL')
depends=('python3')
conflicts=('python-wisent')
source=(http://seehuhn.de/media/programs/wisent-$pkgver.tar.gz
	grammar.patch)
md5sums=('f346ae35d789ee33d9c0a829ff318448'
	'8e6931bfad8c8a9eb7c1fb23aa012eb1')

build() {
	cd $srcdir/wisent-$pkgver
	./configure --prefix=/usr
    patch -p2 -i $srcdir/grammar.patch
    2to3 -w *.py
    sed -i 's/PYTHON\s*=\s*\/usr\/bin\/python/PYTHON = \/usr\/bin\/python3/' Makefile
    sed -i 's/PYTHON_VERSION = 2.6/PYTHON_VERSION = 3.1/' Makefile
    sed -i 's/\/python2.6\//\/python3.1\//g' Makefile
    sed -i 's/^\t/        /g' scanner.py
	make || return 1
	make DESTDIR=$pkgdir PYTHON=python3 install || return 1
}
