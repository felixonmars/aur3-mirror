# Maintainer: Brandon Invergo <brandon@invergo.net>
pkgname=makefile2graph
pkgver=1.5.0
pkgrel=1
pkgdesc="Create a graph figure showing dependencies in a Makefile"
arch=('i686' 'x86_64')
url="https://github.com/lindenb/makefile2graph"
license=('MIT')
depends=('bash')
makedepends=()
source=("https://github.com/lindenb/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('7eb822eced522ef03ab29c893e59d2d3')

build() {
	cd "$pkgname-$pkgver"
	make prefix=/usr
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" prefix=/usr install
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
