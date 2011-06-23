# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-chaco-git
pkgver=20110623
pkgrel=1
pkgdesc="Interactive 2-Dimensional Plotting"
arch=('i686' 'x86_64')
url="https://github.com/enthought/chaco"
license=('BSD')
depends=('python2' 'python2-enable')
makedepends=('git' 'python2-distribute' 'gcc')
provides=('python2-chaco')
conflicts=('python-enthought-chaco' 'python2-chaco' 'python-ets-chaco-svn')
replaces=('python-ets-chaco-svn')
options=(!emptydirs)

_gitroot="https://github.com/enthought/chaco.git"
_gitname="chaco"

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

