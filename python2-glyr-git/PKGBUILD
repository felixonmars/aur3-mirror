# Maintainer: OK100 <ok100 at lavabit dot com>

pkgname=python2-glyr-git
_gitname=python-glyr
pkgver=2012.08.06.g5e8d9e2
pkgrel=1
pkgdesc="Python bindings to libglyr"
url="https://github.com/sahib/python-glyr"
license=('GPL3')
arch=(any)
depends=('python2' 'glyr-git')
makedepends=('git' 'cython2')
source=('git://github.com/sahib/python-glyr.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/$_gitname
  git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:
