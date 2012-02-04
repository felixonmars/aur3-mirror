# Maintainer: ms <ms@kilabit.org>
pkgname=rescached
pkgver=2011.11.03.0156
pkgrel=1
pkgdesc="resolver/DNS cache daemon"
arch=('i686' 'x86_64')
url="http://kilabit.org"
license=('custom:BSD')
source=(https://github.com/downloads/shuLhan/rescached/${pkgname}-${pkgver}.tar.bz2)
md5sums=('428961b40d7108daec0b0d8c27b9f5df')

build() {
	cd "$srcdir/$pkgname/src"
	echo ">>"
	echo ">> cleaning ..."
	echo ">>"
	make distclean
	echo ">>"
	echo ">> make ..."
	echo ">>"
	unset CXXFLAGS
	make || return 1
}

package() {
	cd "$srcdir/$pkgname/src"

	make DESTDIR=$pkgdir install-arch
}
