# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Maintainer: Felix Yan <felixonmars@gmail.com>
pkgname=python2-envisage-git
pkgver=20111205
pkgrel=1
pkgdesc="Extensible Application Framework"
arch=('any')
url="https://github.com/enthought/envisage"
license=('BSD')
depends=('python2' 'python2-traits' 'python2-traitsui')
makedepends=('git' 'python2-distribute')
provides=('python2-envisage')
conflicts=('python2-envisage')
options=(!emptydirs)

_gitroot="https://github.com/enthought/envisage.git"
_gitname="envisage"

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

