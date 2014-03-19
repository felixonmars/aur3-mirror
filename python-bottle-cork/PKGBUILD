#Maintainer: Matthew Sloan matthew@sloan.cc
pkgname=python-bottle-cork
pkgver=0.10
pkgrel=1
pkgdesc="Bottle Authentication/Authorization library"
arch=(any)
url="https://pypi.python.org/pypi/bottle-cork/"
license=('LGPL')
depends=('python' 'python-bottle')
makedepends=('python-distribute')
source=("https://pypi.python.org/packages/source/b/bottle-cork/bottle-cork-${pkgver}.tar.gz")
md5sums=('b3ea8fc2ca1f83f22141ad4b97a0cf39')

package() {
  cd "${srcdir}/bottle-cork-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
