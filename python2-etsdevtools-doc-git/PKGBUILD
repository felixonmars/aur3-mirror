# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-etsdevtools-doc-git
pkgver=20110623
pkgrel=1
pkgdesc="Documentation for Etsdevtools"
arch=('any')
url="https://github.com/enthought/etsdevtools"
license=('BSD')
makedepends=('git' 'python2-distribute')
provides=('python2-etsdevtools-doc')
conflicts=('python2-etsdevtools-doc')
options=(!emptydirs)

_gitroot="https://github.com/enthought/etsdevtools.git"
_gitname="etsdevtools"

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

  cd docs

  make html

  install -d "${pkgdir}"/usr/share/doc/enthought/etsdevtools
  cp -r build/html/* "${pkgdir}"/usr/share/doc/enthought/etsdevtools
}

