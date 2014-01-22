# Contributor: Wes Brown <wesbrown18@gmail.com>
pkgname=python2-pefile
pkgver=1.2.10_139
pkgrel=1
pkgdesc="This is a Python library for PE file support and investigation."
arch=('any')
url="http://code.google.com/p/pefile/"
license=('MIT')
depends=('python2')
makedepends=('python2-distribute')
source=("http://pefile.googlecode.com/files/pefile-${pkgver//_/-}.tar.gz")

build() {
  cd "${srcdir}/pefile-${pkgver//_/-}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/pefile-${pkgver//_/-}"
  python2 setup.py install -O1 --skip-build --root="${pkgdir}" --prefix="/usr"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

md5sums=('f10a94320bfaca356fff4d28c41e9278')
