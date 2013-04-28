# Maintainer: Your Name <youremail@domain.com>
pkgname=libsbsms
pkgver=2.0.1
pkgrel=1
pkgdesc="Library for time stretching and pitch scaling of audio"
arch=('i686' 'x86_64')
url="http://sbsms.sourceforge.net/"
license=('GPL')
options=(!libtool)
source=("http://downloads.sourceforge.net/project/sbsms/sbsms/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('409fb6f4f64e48ff1a7bc18621b952fb')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
