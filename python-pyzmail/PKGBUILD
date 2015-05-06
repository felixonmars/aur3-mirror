# Maintainer: Adam Howard <aeh@aehdev.net>
pkgname=python-pyzmail
_pypiname=pyzmail
pkgver=1.0.3
pkgrel=1
pkgdesc="Python easy mail library, to parse, compose and send emails"
arch=(any)
url="https://pypi.python.org/pypi/$_pypiname/"
license=('LGPL')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/$_pypiname/$_pypiname-$pkgver.tar.gz")
sha256sums=('a74e0df4cfdfa20307dedb795be149f55982d9db0c2e80ceeb16f2ccd16a6587')

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
