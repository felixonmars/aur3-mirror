# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=libktorrent-git
pkgver=311.ce7f614
pkgrel=1
pkgdesc='A BitTorrent protocol implementation'
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/extragear/network/libktorrent"
license=('GPL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4' 'git' 'boost' 'doxygen')
provides=(libktorrent)
conflicts=(libktorrent)
source=()
md5sums=()

_gitroot="git://anongit.kde.org/libktorrent"
_gitname="libktorrent"

build() {
  git clone $_gitroot $_gitname
  mkdir build
  cd build

  cmake ../${_gitname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  
  make
}


package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

pkgver() {
  cd $srcdir/$_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}