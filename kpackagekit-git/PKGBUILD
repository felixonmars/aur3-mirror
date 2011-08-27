# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kpackagekit-git
pkgver=20110328
pkgrel=1
pkgdesc="An application and package manager using PackageKit"
arch=('i686' 'x86_64')
url="http://kde.org"
license=('GPL')
depends=('kdebase-workspace' 'packagekit-qt')
makedepends=('git' 'cmake' 'automoc4')
provides=('kpackagekit' 'apper')
conflicts=('kpackagekit')

_gitroot="git://anongit.kde.org/apper.git"
_gitname="kpackagekit"

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
