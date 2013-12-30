# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libdvdnav-videolan-git
pkgver=20130820.5c47461
pkgrel=1
pkgdesc="Library to navigate DVD disks. Videolan Fork (GIT version)"
arch=('i686' 'x86_64')
url="http://git.videolan.org/?p=libdvdnav.git;a=summary"
license=('GPL2')
depends=('libdvdread-videolan-git')
makedepends=('git')
provides=('libdvdnav')
conflicts=('libdvdnav')
options=('!libtool')
source=("git://git.videolan.org/libdvdnav.git")
md5sums=('SKIP')
_gitname="libdvdnav"

pkgver() {
  cd "${_gitname}"
  echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
  #echo "$(git describe --always | tr - .)"
}

build() {
  cd "${_gitname}"
  autoreconf -if
  ./configure --prefix=/usr --enable-static=no
  make
}

package() {
  cd "${_gitname}"
  make DESTDIR="${pkgdir}" install
}
