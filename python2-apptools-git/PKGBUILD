# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-apptools-git
pkgver=20110623
pkgrel=1
pkgdesc="Application tools"
arch=('any')
url="https://github.com/enthought/apptools"
license=('BSD')
depends=('python2' 'python-configobj' 'python2-traitsui')
makedepends=('git' 'python2-distribute')
provides=('python2-apptools')
conflicts=('python-enthought-utils' 'python2-apptools' 'python-ets-apptools-svn')
replaces=('python-ets-apptools-svn')
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

  python2 setup.py install --root="$pkgdir"/ --optimize=1
}

