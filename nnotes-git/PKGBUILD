# Maintainer: birdflesh <antkoul at gmail dot com>

pkgname=nnotes-git
pkgver=20110902
pkgrel=1
pkgdesc="Nepomuk Notes (nnotes) is a note taking application which uses Nepomuk as a backend"
arch=('i686' 'x86_64')
url="http://vhanda.in/blog/category/nepomuk"
license=('GPL')
depends=('kdebase-runtime')
makedepends=('git' 'cmake' 'automoc4')

_gitroot="git://anongit.kde.org/scratch/vhanda/nnotes.git"
_gitname="nnotes"

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
