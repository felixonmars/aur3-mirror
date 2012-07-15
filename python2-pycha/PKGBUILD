# Maintainer: Jakub Klinkovský <kuba.klinkovsky@gmail.com>
pkgname=python2-pycha
pkgver=279
pkgrel=1
pkgdesc="Pycha is a very simple Python package for drawing charts using the great Cairo library."
arch=('any')
url="http://bitbucket.org/lgs/pycha/"
license=('LGPL')
depends=('pycairo')
makedepends=('python2-distribute')

_hgroot="https://bitbucket.org/lgs"
_hgrepo="pycha"

build() {
  cd "$srcdir/$_hgrepo"
  python2 setup.py install --root=$pkgdir
}
