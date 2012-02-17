#Maintainer: Gergely Imreh <imrehg(at)gmail(dot)com>
python=python2
name=xstatic
pkgname=$python-$name-hg
pkgver=18
pkgrel=1
pkgdesc="Providing static file packages with minimal overhead"
depends=('python2')
arch=('any')
url="http://pypi.python.org/pypi/XStatic"
license=('MIT')
provides=('xstatic')
makedepends=('mercurial')

_hgroot="http://bitbucket.org/thomaswaldmann"
_hgrepo=$name

build() {
  cd $srcdir/$name
  $python setup.py install --prefix=/usr --root=$pkgdir
}
