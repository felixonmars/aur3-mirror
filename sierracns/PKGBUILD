# Maintainer: Alex Suykov <alex.suykov@gmail.com>
pkgname=sierracns
pkgver=0.5
pkgrel=2
pkgdesc="Control and status tool for Sierra Wireless 3G modems"
arch=(i686 x86_64)
url="https://github.com/arsv/sierracns/"
license=('GPL')
depends=(glibc)
makedepends=(gcc make gawk)
source=(https://github.com/arsv/sierracns/archive/$pkgver.tar.gz)
sha256sums=('5ee6797ecf4987f68fd18c1d11fbac66da72202b6a280a5767cdf9026142c4fe')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
