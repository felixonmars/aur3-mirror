# Maintainer: p2k <patrick.schneider@uni-ulm.de>
pkgname=pyswip
pkgver=0.2.2
pkgrel=1
pkgdesc="Python wrapper for SWI-Prolog"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pyswip/"
license="GPL"
source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz)
depends=('python2' 'swi-prolog')
makedepends=('setuptools')
md5sums=('2ff192e10e1762297eba597cb2a0a9da')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --prefix=/usr --root=${pkgdir}
	mkdir -p "${pkgdir}/usr/share/${pkgname}"
	cp -R README examples "${pkgdir}/usr/share/${pkgname}"
}

