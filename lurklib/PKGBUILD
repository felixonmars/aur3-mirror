# Maintainer: LK- <jamieleshaw@gmail.com>
pkgname=lurklib
pkgver=0.6.0.1
pkgrel=1
pkgdesc="Lurklib is a threading-safe, event-driven IRC library designed for creating anything from bots to full-fledged IRC Clients."
arch=(any)
url="http://github.com/LK-/lurklib/"
license=('GPL')
depends=(setuptools)
optdepends=('python: Support for Python 3+'
'python2: Support for Python 2.6+')
source=(http://pypi.python.org/packages/source/l/lurklib/$pkgname-$pkgver.tar.gz)
md5sums=('e5869480be48f957c14ec6a2484468c4')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root=$pkgdir/ --optimize=1
  python2 setup.py install --root=$pkgdir/ --optimize=1
}
