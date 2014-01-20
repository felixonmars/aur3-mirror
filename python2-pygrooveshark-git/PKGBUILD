# Contributor: Scimmia
# Maintainer: Robert Orzanna <orschiro at gmail dot com>

_python=python2
_pkgname=pygrooveshark
pkgname=$_python-$_pkgname-git
pkgver=3.0.r94.1011700
pkgrel=1
pkgdesc="An implementation of the unofficial Grooveshark API as used by the official clients"
arch=('any')
url="http://koehlma.github.io/projects/pygrooveshark.html"
license=('GPL3')
depends=("$_python")
makedepends=('git')
source=("git://github.com/koehlma/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

# git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'

  printf "$($_python setup.py -V).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"

  $_python setup.py install --root="$pkgdir"
}