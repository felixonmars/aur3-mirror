# Maintainer: Makito Nishimiya <nishimiya a ninja,co,jp>

_module="WSME"
pkgname="python2-wsme"
pkgver=0.6.4
pkgrel=1
pkgdesc="Simplify the writing of REST APIs, and extend them with additional protocols."
arch=('any')
url="https://pypi.python.org/pypi/WSME/0.6.4"
license=("Apache")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/W/${_module}/${_module}-${pkgver}.tar.gz")
sha256sums=('e4c0012b1a592c3889697259c690447dfc8edcbae5b52307709705377305e953')

build() {
  cd "${srcdir}/${_module}-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_module}-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
