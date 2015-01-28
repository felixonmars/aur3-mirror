# Maintainer: Abdzirakhman Abdzi <0xaa@dmg.sx>
pkgname=libevhtp-git
pkgver=1.2.9.r70.g3516276
pkgrel=1
pkgdesc="A more flexible replacement for libevent's httpd API."
arch=('i686' 'x86_64' 'armv5te' 'armv6h' 'armv7h')
url="https://github.com/ellzey/libevhtp"
license=('BSD')
depends=('libevent>=2.0.0')
makedepends=('cmake' 'git')
optdepends=('openssl')
provides=('libevhtp')
options=('staticlibs')

source=("$pkgname"::"git://github.com/ellzey/libevhtp.git#branch=develop")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	cd "$srcdir/$pkgname"
	cmake -DCMAKE_INSTALL_PREFIX=/usr ./
	make
}

package () {
	#install library and header files
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install

	#copy license over
	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	cp LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
