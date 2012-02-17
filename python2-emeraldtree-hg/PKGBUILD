#Maintainer: Gergely Imreh <imrehg(at)gmail(dot)com>
python=python2
name=EmeraldTree
pkgname=$python-emeraldtree-hg
pkgver=81
pkgrel=1
pkgdesc="A light-weight XML object model for Python"
depends=('python2')
arch=('any')
url="http://pypi.python.org/pypi/emeraldtree/"
license=('MIT')
provides=('emeraldtree')
makedepends=('mercurial')

_hgroot="http://hg.moinmo.in"
_hgrepo=$name

build() {
  cd $srcdir/$name
  $python setup.py install --prefix=/usr --root=$pkgdir
}
