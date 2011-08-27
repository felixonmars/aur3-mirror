# Maintainer: Joel Goguen <jgoguen@jgoguen.ca>

pkgname=python25-ssl
_realname=ssl
pkgver=1.15
pkgrel=1
pkgdesc="New SSL module for Python 2.5 and earlier"
arch=('i686' 'x86_64')
license=('Python')
depends=('python25' 'openssl' 'heimdal')
makedepends=()
optdepends=()
options=()
url="http://pypi.python.org/pypi/ssl"
md5sums=('81ea8a1175e437b4c769ae65b3290e0c'
	'c3b36cc99aa3b2f2c6fc2461bb25c6cc')
sha256sums=('1266302ce62c4b60c7ca0e1d3d104ba11d2749e5881d8ac4f006cf9a0446d589'
	'd7e55eb310561c8b6a74b43f96cf6b9e8047c2d1c94b6b24086edb847ae1c4aa')
source=(http://pypi.python.org/packages/source/s/${_realname}/${_realname}-${pkgver}.tar.gz#md5=${md5sums[0]}
	LICENSE)

build() {
	cd "${srcdir}/${_realname}-${pkgver}"

	sed -i 's/python /python2\.5 /g' Makefile
	
	make
	
	install -m755 -d "${pkgdir}/usr/lib/python2.5/site-packages/"
	install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	cp -R "${srcdir}/${_realname}-${pkgver}/build/lib.linux-${CARCH}-2.5/ssl/" "${pkgdir}/usr/lib/python2.5/site-packages/ssl"
}
