# Maintainer: Stéphane Gaudreault <stephane@archlinux.org>
pkgname=pyproj
pkgver=1.8.9
pkgrel=1
pkgdesc="Python interfaces to PROJ.4 library"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pyproj"
license=('custom')
source=(http://pyproj.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
depends=('proj' 'python2')
makedepends=('python2-distribute')
sha1sums=('eebf29135ff8ef25294fe7477270e2bc6836e5dc')

build() {
   cd "${srcdir}/${pkgname}-${pkgver}"

   python2 setup.py build
}

package() {
   cd "${srcdir}/${pkgname}-${pkgver}"

   python2 setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=1

   install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
   install -m644 LICENSE_proj4 ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
