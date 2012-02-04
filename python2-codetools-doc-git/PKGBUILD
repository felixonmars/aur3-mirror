# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-codetools-doc-git
pkgver=20110623
pkgrel=1
pkgdesc="Documentation for Codetools"
arch=('any')
url="https://github.com/enthought/codetools"
license=('BSD')
makedepends=('git' 'python2-distribute')
provides=('python2-codetools-doc')
conflicts=('python2-codetools-doc' 'python-ets-codetools-doc-svn')
replaces=('python-ets-codetools-doc-svn')
options=(!emptydirs)

_gitroot="https://github.com/enthought/codetools.git"
_gitname="codetools"

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

  install -d "${pkgdir}"/usr/share/doc/enthought/codetools
  cp -r build/html/* "${pkgdir}"/usr/share/doc/enthought/codetools
}

