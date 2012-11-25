pkgname=python3-paste-deploy
pkgver=1.5.0
pkgrel=1
pkgdesc="Load, configure, and compose WSGI applications and servers"
arch=('any')
url="http://pythonpaste.org/deploy/"
license=('custom')
depends=('python')
makedepends=('setuptools')
source=(http://pypi.python.org/packages/source/P/PasteDeploy/PasteDeploy-${pkgver}.tar.gz)

md5sums=('f1a068a0b680493b6eaff3dd7690690f')

build() {
  cd $srcdir/PasteDeploy-${pkgver}
  python setup.py install --root=$pkgdir --optimize=1
  install -Dm644 docs/license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt
}
