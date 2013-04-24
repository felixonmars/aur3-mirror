# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=comicmaster-git
pkgver=199.f132a8e
pkgrel=1
pkgdesc="cbr/cbz reader for comics."
url="http://comicmaster.sourceforge.net/Intro.html"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('qt4')
makedepends=('cmake' 'git')
conflicts=('comicmaster')
source=('git+git://comicmaster.git.sourceforge.net/gitroot/comicmaster/comicmaster')
md5sums=('SKIP')

prepare() {
  cd $srcdir/comicmaster

  # Fix Build Type
  sed -i 's|CMAKE_BUILD_TYPE Debug|CMAKE_BUILD_TYPE release|' CMakeLists.txt
  
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
  cd $srcdir/comicmaster

  make
}

package() {
  cd $srcdir/comicmaster

  make DESTDIR=$pkgdir install
}

pkgver() {
  cd $srcdir/comicmaster

  echo $(git rev-list --count master).$(git rev-parse --short master)
}