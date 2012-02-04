# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-mayavi-doc-git
pkgver=20110623
pkgrel=1
pkgdesc="Documentation for Mayavi"
arch=('any')
url="https://github.com/enthought/mayavi"
license=('BSD')
makedepends=('git' 'python2-distribute')
conflicts=('python2-mayavi-doc')
options=(!emptydirs)

_gitroot="https://github.com/enthought/mayavi.git"
_gitname="mayavi"

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

  install -d "${pkgdir}"/usr/share/doc/enthought/{mayavi,tvtk}
  cp -r build/mayavi/html/* "${pkgdir}"/usr/share/doc/enthought/mayavi
  cp -r build/tvtk/html/* "${pkgdir}"/usr/share/doc/enthought/tvtk
}

