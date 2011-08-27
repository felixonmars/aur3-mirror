# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-blockcanvas-git
pkgver=20110623
pkgrel=1
pkgdesc="Visual Environment for Creating Simulation Experiments"
arch=('i686' 'x86_64')
url="https://github.com/enthought/blockcanvas"
license=('BSD')
depends=('python2' 'python2-codetools' 'python2-apptools' 'python2-chaco'
         'python2-etsdevtools' 'python2-scimath')
makedepends=('git' 'python2-distribute' 'gcc')
provides=('python2-blockcanvas')
conflicts=('python2-blockcanvas' 'python-ets-blockcanvas-svn')
replaces=('python-ets-blockcanvas-svn')
options=(!emptydirs)

_gitroot="https://github.com/enthought/blockcanvas.git"
_gitname="blockcanvas"

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

