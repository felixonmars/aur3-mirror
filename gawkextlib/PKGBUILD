# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
pkgname=gawkextlib
pkgver=1.0.0
pkgrel=1
pkgdesc="gawk extension package"
url="http://gawkextlib.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gawk>=4.1.1')
source=("http://prdownloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('9f96978a3edf9c84d2cafe8c53ad6e3c')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make install DESTDIR="$pkgdir"
}
