# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=comicmaster
pkgver=0071
pkgrel=2
pkgdesc="The swiss army knife of the digital comic world."
arch=('i686' 'x86_64')
url="http://comicmaster.sourceforge.net/"
license=('GPL2')
depends=('qt5-base' 'unrar' 'unzip')
makedepends=('cmake')
optdepends=('rar: for creating cbr books'
            'zip: for creating cbz books')
conflicts=('comicmaster-git')
source=(http://downloads.sourceforge.net/comicmaster/ComicMaster.$pkgver.tar.bz2)
md5sums=('2e87333bc15291f90e9902b6ae88f4b0')

prepare() {
  cd $srcdir/ComicMaster

  # Fix Build Type
  sed -i 's|CMAKE_BUILD_TYPE Debug|CMAKE_BUILD_TYPE release|' CMakeLists.txt

  # Disable '-Werror' compiler flag
  sed -i 's/-Werror/\ /' CMakeLists.txt

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
  cd $srcdir/ComicMaster
  make
}

package() {
  cd $srcdir/ComicMaster
  install -Dm755 bin/ComicMaster $pkgdir/usr/bin/ComicMaster
}
