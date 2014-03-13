# Maintainer: James Bulmer <nekinie@gmail.com>

pkgname="python2-lesscpy"
pkgver=0.10.1
pkgrel=1
pkgdesc="Python LESS compiler"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/lesscpy"
license=("MIT")
depends=(
  "python2"
  "python2-ply"
)
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/l/lesscpy/lesscpy-${pkgver}.tar.gz")
md5sums=("2a5ea6b1cebb48601632f2e452348ffc")

build() {
  cd "${srcdir}/lesscpy-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/lesscpy-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}