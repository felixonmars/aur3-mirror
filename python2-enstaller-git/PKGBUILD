# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-enstaller-git
pkgver=20110205
pkgrel=1
pkgdesc="Install and managing tool for egg-based packages"
arch=('any')
url="https://github.com/enthought/enstaller"
license=('BSD')
depends=('python2')
makedepends=('git' 'python2-distribute')
provides=('python2-enstaller')
conflicts=('python2-enstaller' 'python-ets-enstaller-svn')
replaces=('python-ets-enstaller-svn')
options=(!emptydirs)

_gitroot="https://github.com/enthought/enstaller.git"
_gitname="enstaller"

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

  python2 setup.py install --root="$pkgdir"/ --optimize=1 || return 1
}

