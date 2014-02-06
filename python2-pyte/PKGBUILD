pkgname='python2-pyte'
pkgver=0.4.8
pkgrel=1
pkgdesc="Simple VTXXX-compatible terminal emulator"
arch=('any')
url="https://pypi.python.org/pypi/pyte"
license=('LGPL3')
depends=('python2')
makedepends=('python2-distribute')
source=("https://pypi.python.org/packages/source/p/pyte/pyte-${pkgver}.tar.gz")
md5sums=('ae34d268558ff2fedb99081eb3e03b57')

package() {
  cd "${srcdir}/pyte-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
