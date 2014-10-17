# Maintainer: Niko Rosvall <niko@ideabyte.net>
pkgname=memo-nrosvall
pkgver=0.7
pkgrel=1
pkgdesc="Unix-style note taking software"
arch=('i686' 'x86_64')
url="http://www.ideabyte.net/memo/"
license=('GPL3')
depends=(glibc)
source=("http://www.ideabyte.net/memo/memo-$pkgver.tar.gz")
md5sums=('4198bc43f7da2e89c3d146d9a20ca5b9')

build() {
	cd "$srcdir/memo-$pkgver"
	make
}

package() {
	cd "$srcdir/memo-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	make PREFIX="$pkgdir/usr" install
}
