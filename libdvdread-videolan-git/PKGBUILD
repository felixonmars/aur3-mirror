# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libdvdread-videolan-git
pkgver=20131229.ee24a03
pkgrel=1
pkgdesc="Library to access DVD disks. Videolan Fork (GIT version)"
arch=('i686' 'x86_64')
url="http://git.videolan.org/?p=libdvdread.git;a=summary"
license=('GPL2')
depends=('libdvdcss-git')
makedepends=('git')
provides=('libdvdread')
conflicts=('libdvdread')
source=("git://git.videolan.org/libdvdread.git")
md5sums=('SKIP')
_gitname="libdvdread"

pkgver() {
  cd "${_gitname}"
  echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
  #echo "$(git describe --always | tr - .)"
}

build() {
  cd "${_gitname}"
  autoreconf -i
  ./configure --prefix=/usr --enable-static=no --with-libdvdcss
  make
}

package() {
  cd "${_gitname}"
  make DESTDIR="${pkgdir}" install
}
