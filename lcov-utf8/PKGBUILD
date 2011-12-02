# Contributor: Jordi De Groof <jordi dot degroof at gmail dot com>
pkgname=lcov-utf8
pkgver=1.9
pkgrel=1
pkgdesc="front-end for GCC's coverage testing tool gcov, utf-8 charset"
arch=('i686' 'x86_64')
url="http://ltp.sourceforge.net/coverage/lcov.php"
license=('GPL')
depends=('perl')
conflicts=('lcov')
source=("http://downloads.sourceforge.net/ltp/lcov-$pkgver.tar.gz"
	charset.patch )
md5sums=('8b88cfc0200a8c176b879ac115a31379'
	 '0e6fdaf007026ec27fa7b8688b568695')

build() {
 patch -p0 < charset.patch
 cd "$srcdir/lcov-$pkgver"

 make PREFIX="$pkgdir" install || return 1
}

# vim:set ts=2 sw=2 et:
