# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
pkgname=gawk-xml
pkgver=1.0.2
pkgrel=1
pkgdesc="XML extension for gawk (former xgawk)"
url="http://gawkextlib.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gawkextlib')
source=("http://prdownloads.sourceforge.net/gawkextlib/${pkgname}-${pkgver}.tar.gz")
md5sums=('cec3b7508b14b8fffaaa0dc10ef0ae94')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make install DESTDIR="$pkgdir"
}
