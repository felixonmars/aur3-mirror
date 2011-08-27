# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-pyface-git
pkgver=20110623
pkgrel=1
pkgdesc="Traits-capable windowing framework"
arch=('any')
url="https://github.com/enthought/pyface"
license=('BSD')
depends=('python2' 'python2-traits')
makedepends=('git' 'python2-distribute')
optdepends=('python2-pyqt' 'pyside' 'wxpython')
provides=('python2-pyface')
conflicts=('python2-pyface')
options=(!emptydirs)

_gitroot="https://github.com/enthought/pyface.git"
_gitname="pyface"

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

