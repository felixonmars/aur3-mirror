# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
pkgname=pysparse
pkgver=1.1.1
pkgrel=3
pkgdesc="Sparse linear algebra extension for Python."
arch=('i686' 'x86_64')
url="http://pysparse.sourceforge.net"
license=('BSD License')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('a9f4d0b31488a08cc3235df0b3d8b558')
depends=('python2' 'python2-numpy')
makedepends=('python2-distribute')

build() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   sed -i "s/'g2c'//g" setup.py
   python2 setup.py build
}

package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   python2 setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=1
}
