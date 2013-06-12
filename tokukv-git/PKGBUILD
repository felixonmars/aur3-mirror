# Contributor: Aaron Chen <nextAaron at gmail.com>

pkgname=tokukv-git
pkgver=78540c6
pkgrel=1
pkgdesc="TokuKV is a high-performance, transactional key-value store"
arch=('x86_64')
_gitname=ft-index
source=('ft-index::git+https://github.com/Tokutek/ft-index.git' 'jemalloc::git+https://github.com/Tokutek/jemalloc.git')
#'0001-Compiler-warnings-for-uninitialized.patch')
url="http://github.com/Tokutek/ft-index"
license=(GPL)
depends=()
makedepends=('git' 'cmake>=2.8.8' 'pacman>=4.1')
conflicts=()
provides=()
options=()
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd $_gitname
  git describe --always | sed 's/.*=//' | sed 's/.*-g//g'
}

build() {
  cd $_gitname

  mkdir build
  cd build
  cmake -D CMAKE_BUILD_TYPE=Release -D USE_BDB=OFF -D BUILD_TESTING=OFF -D CMAKE_INSTALL_PREFIX=/usr -D JEMALLOC_SOURCE_DIR=../../jemalloc ..
  make
}

package() {
  cd $_gitname/build
  make PREFIX=/usr DESTDIR="$pkgdir" install
  rm $pkgdir/usr/include/db.h
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
