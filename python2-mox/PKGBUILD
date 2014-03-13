# Maintainer: James Bulmer <nekinie@gmail.com>

pkgname="python2-mox"
pkgver=0.5.3
pkgrel=1
pkgdesc="Mock object framework"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/mox"
license=("Apache")
depends=("python2")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/m/mox/mox-${pkgver}.tar.gz")
md5sums=("6de7371e7e8bd9e2dad3fef2646f4a43")

build() {
  cd "${srcdir}/mox-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/mox-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}