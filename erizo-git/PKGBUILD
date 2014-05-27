pkgname=erizo-git
pkgver=0.0.0
pkgrel=1
pkgdesc="A C/C++ Multipoint Control Unit (MCU) Library for WebRTC"
arch=('i686' 'x86_64')
url="https://github.com/ging/licode"
license=('MIT')
depends=('pacman' 'boost' 'boost-libs' 'libsrtp' 'libnice')
makedepends=('git' 'cmake')
provides=('erizo')
source=("$pkgname"::'git://github.com/ging/licode.git')

md5sums=('SKIP')

pkgver() {
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd $srcdir/$pkgname/erizo
	./generateProject.sh
	./buildProject.sh
}

package() {
	cd $srcdir/$pkgname/erizo
	install -Dm644 build/erizo/liberizo.so $pkgdir/usr/lib/liberizo.so
}
