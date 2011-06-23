# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-apptools-doc-git
pkgver=20110623
pkgrel=1
pkgdesc="Documentation for Apptools"
arch=('any')
url="https://github.com/enthought/apptools"
license=('BSD')
makedepends=('git' 'python2-distribute')
provides=('python2-apptools-doc')
conflicts=('python2-apptools-doc' 'python-ets-apptools-doc-svn')
replaces=('python-ets-apptools-doc-svn')
options=(!emptydirs)

_gitroot="https://github.com/enthought/apptools.git"
_gitname="apptools"

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

  install -d "${pkgdir}"/usr/share/doc/enthought/apptools
  cp -r build/html/* "${pkgdir}"/usr/share/doc/enthought/apptools
}

