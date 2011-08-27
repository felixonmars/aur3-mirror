# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-traitsui-git
pkgver=20110623
pkgrel=1
pkgdesc="Traits-capable user interfaces"
arch=('any')
url="https://github.com/enthought/traitsui"
license=('BSD')
depends=('python2' 'python2-traits' 'python2-pyface')
makedepends=('git' 'python2-distribute')
provides=('python2-traitsui')
conflicts=('python2-traitsui')
options=(!emptydirs)

_gitroot="https://github.com/enthought/traitsui.git"
_gitname="traitsui"

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

