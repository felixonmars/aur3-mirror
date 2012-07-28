# Maintainer: Vadim Bubnov <vadim@moinet.ru>

pkgname=kdeplasma-applets-dob-git
pkgver=20120728
pkgrel=1
pkgdesc="Desktop OBserver plasmoid for KDE"
arch=('i686' 'x86_64')
url='http://wiki.github.com/bvadim/dob-plasmoid/'
license=('GPL')
depends=('kdebase-workspace')
makedepends=('git' 'cmake' 'automoc4')
conflicts=('dob-plasmoid-git')
replaces=('dob-plasmoid-git')

_gitroot="git://github.com/bvadim/dob-plasmoid.git"
_gitname="dob-plasmoid"

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

  rm -rf "$srcdir/build"
  mkdir "$srcdir/build"
  cd "$srcdir/build"

  cmake ../${_gitname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}