# Contributor: birdflesh <antkoul at gmail dot com>

pkgname=colord-kde-git
pkgver=20120316
pkgrel=1
pkgdesc="Interfaces and session daemon to colord for KDE"
arch=('i686' 'x86_64')
url="http://projects.kde.org/colord-kde"
license=('GPL')
depends=('kdelibs' 'colord')
makedepends=('git' 'cmake' 'automoc4')

_gitroot="git://anongit.kde.org/colord-kde.git"
_gitname="colord-kde"

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
