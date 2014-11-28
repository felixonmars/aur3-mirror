# Maintainer: Thiago Avelino <thiago@avelino.xxx>

pkgname=python-bottle-mongo
pkgver=0.2.3
pkgrel=1
pkgdesc="Bottle MongoDB plugin"
arch=(any)
url="https://pypi.python.org/pypi/bottle-mongo/"
license=('MIT')
depends=('python' 'python-bottle' 'python-pymongo')
makedepends=('python-distribute')
source=("https://pypi.python.org/packages/source/b/bottle-mongo/bottle-mongo-${pkgver}.tar.gz")
sha256sums=('eda4cd5da762d1940ac6ff5fcf2356bbd32b622ff4267b44267a15580ed3a837')

package() {
  cd "${srcdir}/bottle-mongo-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
