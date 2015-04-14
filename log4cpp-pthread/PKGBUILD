# Maintainer: Marat Akhin <marat.akhin@gmail.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Geraud Le Falher <daureg@gmail.com>

pkgname=log4cpp-pthread
pkgver=1.1.1
pkgrel=1
pkgdesc="A library of C++ classes for flexible logging to files, syslog, IDSA and other destinations (with pthread support)"
arch=('i686' 'x86_64')
url="http://log4cpp.sourceforge.net/"
license=('LGPL')

depends=('gcc-libs')
provides=('log4cpp')
conflicts=('log4cpp')

source=(http://downloads.sourceforge.net/log4cpp/log4cpp-$pkgver.tar.gz)
md5sums=('1e173df8ee97205f412ff84aa93b8fbe')

build() {
	cd "$srcdir/log4cpp"
	./configure --prefix=/usr --disable-doxygen --disable-dot --without-idsa --with-pthread
	make
}

package() {
	cd "$srcdir/log4cpp"
	make DESTDIR="$pkgdir" install
}

# vim: set ft=sh ts=2 sw=2 et:
