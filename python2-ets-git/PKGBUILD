# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-ets-git
pkgver=20110623
pkgrel=1
pkgdesc="Enthought Tool Suite"
arch=('any')
url="https://github.com/enthought/ets"
license=('BSD')
depends=('python2' 'python2-apptools-git' 'python2-blockcanvas-git' 'python2-chaco-git'
         'python2-codetools-git' 'python2-enable-git' 'python2-envisage-git' 'python2-etsdevtools-git'
         'python2-etsproxy-git' 'python2-graphcanvas-git' 'python2-mayavi-git' 'python2-pyface-git'
         'python2-scimath-git' 'python2-traits-git' 'python2-traitsui-git')
makedepends=('git' 'python2-distribute')
optdepends=('python2-ets-doc-git')
provides=('python2-ets')
conflicts=('python2-ets')
options=(!emptydirs)

_gitroot="https://github.com/enthought/ets.git"
_gitname="ets"

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

