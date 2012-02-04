# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-enable-git
pkgver=20110623
pkgrel=1
pkgdesc="Low level drawing and interaction packages"
arch=('i686' 'x86_64')
url="https://github.com/enthought/enable"
license=('BSD')
depends=('python2' 'python-reportlab' 'libxt' 'libxtst' 'python2-traitsui')
makedepends=('git' 'python2-distribute' 'gcc' 'cython' 'swig')
provides=('python2-enable')
conflicts=('python-enthought-enable' 'python2-enable' 'python-ets-enable-svn')
replaces=('python-ets-enable-svn')
options=(!emptydirs)

_gitroot="https://github.com/enthought/enable.git"
_gitname="enable"

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

