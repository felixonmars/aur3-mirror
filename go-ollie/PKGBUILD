#Maintainer : Jesse Jaara <Gmail.com: jesse.jaara>

pkgname=go-ollie
pkgver=1.3
pkgrel=4
pkgdesc="Go Ollie is a platform game with beautifully rendered scenes and animations."
arch=(i686 x86_64)
url="http://www.tweeler.com/index.php?PAGE=goollie_linux"
license=('GPL3')
depends=('libtuxcap')
makedepends=('cmake')
source=('http://huulivoide.pp.fi/Arch/GoOllie_1.3_src.tar.xz' 'GoOllie.desktop')


build() {
  cd "$srcdir/GoOllie-1.3"

  sed 's|libtuxcap.so.4.0|libtuxcap.so|' -i src/CMakeLists.txt
  sed 's|/usr/share/games/goollie|/usr/share/goollie|' -i src/main.cpp

  cmake ./
  make
}

package() {
  cd "$srcdir/GoOllie-1.3"

  mkdir -p "$pkgdir/usr/share/pixmaps"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/goollie"
  mkdir -p "$pkgdir/usr/bin"

  cp ./GoOllie "$pkgdir/usr/bin/"

  cp -r ./data/* "$pkgdir/usr/share/goollie/"
  cp ./src/*py "$pkgdir/usr/share/goollie/"

  cp ../../GoOllie.desktop "$pkgdir/usr/share/applications/"
  cp ./data/extraResources/Logos/icon.png "$pkgdir/usr/share/pixmaps/goollie.png"
}

md5sums=('f8c461b71f822c26b8dace8d4adf83f3'
         '39d95ef38fb201ccce55743e499fe30b')
