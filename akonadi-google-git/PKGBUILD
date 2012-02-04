# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=akonadi-google-git
pkgver=20110613
pkgrel=1
pkgdesc="An Akonadi resource for accessing Google services"
arch=('i686' 'x86_64')
url="http://progdan.cz/category/akonadi-google/"
license=('GPL')
depends=('kdepimlibs' 'qjson')
makedepends=('git' 'cmake' 'automoc4' 'boost')
provides=('akonadi-google')
conflicts=('akonadi-google')

_gitroot="git://anongit.kde.org/akonadi-google.git"
_gitname="akonadi-google"

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
