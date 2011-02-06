# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-appinst-git
pkgver=20110205
pkgrel=1
pkgdesc="Cross platform APIs used to install applications"
arch=('any')
url="https://github.com/enthought/appinst"
license=('BSD')
depends=('python2')
makedepends=('git' 'python2-distribute')
provides=('python2-appinst')
conflicts=('python2-appinst' 'python-ets-appinst-svn')
replaces=('python-ets-appinst-svn')
options=(!emptydirs)

_gitroot="https://github.com/enthought/appinst.git"
_gitname="appinst"

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

