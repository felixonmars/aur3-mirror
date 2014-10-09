# Maintainer: Christian Muehlhaeuser <muesli@gmail.com>

pkgname=libdavros-git
pkgver=20141008
pkgrel=1
pkgdesc="C++/Qt debugging & logger library"
arch=('i686' 'x86_64')
url="https://github.com/muesli/libdavros"
license=('LGPL')
makedepends=('git')
depends=('qt4')
provides=('libdavros')
source=()
md5sums=()

_gitroot="git@github.com:muesli/libdavros.git"
_gitname="libdavros"

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
  git clone -l "$srcdir/$_gitname" "$srcdir/$_gitname-build"

  cd "$srcdir/$_gitname-build"
  cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/usr \
        -DCMAKE_BUILD_TYPE=Release \
	.
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make install
}
