# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-codetools-git
pkgver=20110623
pkgrel=1
pkgdesc="Code Analysis and Execution Tools"
arch=('any')
url="https://github.com/enthought/codetools"
license=('BSD')
depends=('python2' 'python2-traits')
makedepends=('git' 'python2-distribute')
provides=('python2-codetools')
conflicts=('python2-codetools' 'python-ets-codetools-svn')
replaces=('python-ets-codetools-svn')
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

  python2 setup.py install --root="$pkgdir"/ --optimize=1
}

