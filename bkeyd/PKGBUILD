# Maintainer: Benjamin Bolton benjamin@bennybolton.com

pkgname=bkeyd
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight hot-key daemon independent of X"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/bkeyd"
install="bkeyd.install"
license=('GPL')
depends=(glibc)
makedepends=(gcc binutils linux-api-headers gzip)
source=("http://sourceforge.net/projects/bkeyd/files/bkeyd-$pkgver.tar.gz")
md5sums=('05807e2007173619153704e84257c272')

build(){
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package(){
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
