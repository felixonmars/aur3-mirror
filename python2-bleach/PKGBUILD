# Maintainer: fsckd <fsckdaemon@gmail.com>

pkgname=python2-bleach
pkgver=1.1.5
pkgrel=1
pkgdesc="An easy whitelist-based HTML-sanitizing tool"
arch=('any')
license=('BSD')
url="http://pypi.python.org/pypi/bleach"
depends=('python2' 'python2-nose' 'python2-html5lib')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/b/bleach/bleach-${pkgver}.tar.gz")
md5sums=('6b4f76ae47c40f5170a3e674dc96281c')
sha256sums=('21bc46db401ec6b2d3fee9209ddbff9192bd586a3c86a98dd055e6a08b178625')

build() {
  cd "${srcdir}/bleach-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/bleach-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
}
