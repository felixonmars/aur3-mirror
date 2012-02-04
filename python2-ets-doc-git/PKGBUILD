# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-ets-doc-git
pkgver=20110623
pkgrel=1
pkgdesc="Documentation for ETS"
arch=('any')
url="https://github.com/enthought/ets"
license=('BSD')
depends=('python2-apptools-doc-git' 'python2-blockcanvas-doc-git' 'python2-chaco-doc-git'
         'python2-codetools-doc-git' 'python2-enable-doc-git' 'python2-envisage-doc-git'
         'python2-etsdevtools-doc-git' 'python2-mayavi-doc-git' 'python2-pyface-doc-git'
         'python2-scimath-doc-git' 'python2-traits-doc-git' 'python2-traitsui-doc-git')
makedepends=('git' 'python2-distribute')
conflicts=('python2-ets-doc')
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

  cd docs

  make html

  install -d "${pkgdir}"/usr/share/doc/enthought/ets
  cp -r build/html/* "${pkgdir}"/usr/share/doc/enthought/ets
}

