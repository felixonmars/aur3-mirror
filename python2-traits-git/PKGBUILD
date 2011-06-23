# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-traits-git
pkgver=20110623
pkgrel=1
pkgdesc="Explicitly typed attributes for Python"
arch=('i686' 'x86_64')
url="https://github.com/enthought/traits"
license=('BSD')
depends=('python2' 'python2-numpy')
makedepends=('git' 'python2-distribute' 'gcc')
provides=('python2-traits')
conflicts=('python-enthought-traits' 'python2-traits' 'python-ets-traits-svn')
replaces=('python-ets-traits-svn')
options=(!emptydirs)

_gitroot="https://github.com/enthought/traits.git"
_gitname="traits"

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

