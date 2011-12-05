# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Maintainer: Felix Yan <felixonmars@gmail.com>
pkgname=python2-graphcanvas-git
pkgver=20111205
pkgrel=1
pkgdesc="Interactive Graph (network) Visualization"
arch=('any')
url="https://github.com/enthought/graphcanvas"
license=('BSD')
depends=('python2' 'python2-networkx' 'python2-enable')
makedepends=('git' 'python2-distribute')
provides=('python2-graphcanvas')
conflicts=('python2-graphcanvas' 'python-ets-graphcanvas-svn')
replaces=('python-ets-graphcanvas-svn')
options=(!emptydirs)

_gitroot="https://github.com/enthought/graphcanvas.git"
_gitname="graphcanvas"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  python2 setup.py install --root="$pkgdir"/ --optimize=1
}

