# Maintainer: Andreas Baumann <abaumann@yahoo.com>

pkgname=libbf
pkgver=0.1
pkgrel=1
pkgdesc="library implementing bloom filters for C++11"
url="https://github.com/mavam/libbf"
license=('custom')
arch=('i686' 'x86_64')
makedepends=('cmake' 'boost')
source=("https://github.com/mavam/${pkgname}/archive/v${pkgver}-beta.tar.gz")
md5sums=('4aeb237eba2d4fa8610ceef41e0debe5')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}-beta

	./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}-beta/build

	make install DESTDIR=$pkgdir
}
