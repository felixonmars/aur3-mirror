# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-scimath-git
pkgver=20110623
pkgrel=1
pkgdesc="Scientific and Mathematical calculations"
arch=('i686' 'x86_64')
url="https://github.com/enthought/scimath"
license=('BSD')
depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-traits')
makedepends=('git' 'python2-distribute' 'gcc')
provides=('python2-scimath')
conflicts=('python2-scimath' 'python-ets-scimath-svn')
replaces=('python-ets-scimath-svn')
options=(!emptydirs)

_gitroot="https://github.com/enthought/scimath.git"
_gitname="scimath"

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

