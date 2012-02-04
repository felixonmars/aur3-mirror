
# Maintainer: Your Name <youremail@domain.com>
pkgname=romwiz
pkgver=1.0
pkgrel=1
pkgdesc="RomWiz is a MAME ROM manager for Linux"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/romwiz/"
license=('GPL')
depends=('qt' 'sqlite3' 'libzip')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgver/$pkgname-$pkgver-src.tar.gz")
md5sums=('940ed5caae6689599a9f6a0b81e61b9c')

build() {
  cd "$srcdir/$pkgname"
  qmake
  make

  # Install icon
  mkdir -p $pkgdir/usr/share/pixmaps/
  install -m 644 images/romwiz.png $pkgdir/usr/share/pixmaps/

  # Install desktop file
  mkdir -p $pkgdir/usr/share/applications/
  install -m 644 applications/romwiz.desktop $pkgdir/usr/share/applications/

  # Install binary
  mkdir -p $pkgdir/usr/bin/
  install -m 755 bin/romwiz $pkgdir/usr/bin/
}
