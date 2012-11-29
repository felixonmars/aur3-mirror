# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=gestures-kde-git
pkgver=20121129
pkgrel=1
pkgdesc="Handles gestures of multi touch input devices"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/base/gestures-kde"
license=('GPL')
depends=('kdelibs' 'geis')
makedepends=('git' 'cmake' 'automoc4')

_gitroot="git://anongit.kde.org/gestures-kde.git"
_gitname="gestures-kde"

build() {
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
  cd build
  make DESTDIR="$pkgdir" install
} 
