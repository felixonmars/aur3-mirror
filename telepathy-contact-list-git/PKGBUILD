# Maintainer: George Brooke <george+arch.aur@george-brooke.co.uk>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=telepathy-contact-list-git
pkgver=20110802
pkgrel=1
pkgdesc="KDE Telepathy contact list application"
arch=('i686' 'x86_64')
url="http://kde.org"
license=('GPL')
depends=('kdebase-runtime' 'telepathy-qt4')
makedepends=('git' 'cmake' 'automoc4')
conflicts=('telepathy-kde-contact-list')
install=${pkgname}.install

_gitroot="git://anongit.kde.org/telepathy-contact-list.git"
_gitname="telepathy-contact-list"

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
