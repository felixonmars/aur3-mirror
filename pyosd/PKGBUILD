# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=pyosd
pkgver=0.2.14
pkgrel=4
pkgdesc="Python bindings to the XOSD library"
arch=(i686 x86_64)
license=('GPL')
url="http://ichi2.net/pyosd/"
source=(http://ichi2.net/pyosd/${pkgname}-${pkgver}.tar.gz)
depends=('python2' 'xosd')
md5sums=('3beb6692c4d76b3318e7876a6dd03bdf')
sha256sums=('a8a52357845f9c84faeab2983f4042b91bbcbb3355d4e70783de7a97aeb3564c')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python2 setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python2 setup.py install --prefix ${pkgdir}/usr
    sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
           -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
           $(find "${pkgdir}" -name '*.py')
}
	
