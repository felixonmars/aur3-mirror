# Contributor: Fabio Volpe <volpefabio@gmail.com>
pkgname=python-pycha
_pkgname=pycha
pkgver=0.5.3
pkgrel=1
pkgdesc="Pycha is a very simple Python package for drawing charts using the great Cairo library."
arch=(i686 x86_64)
url="http://bitbucket.org/lgs/pycha/wiki/Home"
license=('LGPL')
depends=('pycairo')
source=(http://pypi.python.org/packages/source/p/pycha/$_pkgname-$pkgver.tar.gz)
md5sums=('aea1aab42c9d755c74f6d10f3d3c99cb')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root=$startdir/pkg || return 1
}

# vim:set ts=2 sw=2 et:
