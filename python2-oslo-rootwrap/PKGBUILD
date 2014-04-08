# Maintainer: James Bulmer <nekinie@gmail.com>

pkgname="python2-oslo-rootwrap"
pkgver=1.2.0
pkgrel=1
pkgdesc="Oslo rootwrap"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/oslo.rootwrap/"
license=("Apache")

depends=(
  "python2"
  "python2-six"
)

makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/o/oslo.rootwrap/oslo.rootwrap-${pkgver}.tar.gz")
md5sums=("2cd7e0b6e838d2ee492982e99a7834a2")

build() {
  cd "${srcdir}/oslo.rootwrap-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/oslo.rootwrap-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}