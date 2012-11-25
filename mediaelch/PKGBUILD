# Maintainer: Matt Harrison <matt@mistbyte.com>

pkgname=mediaelch
pkgver=1.1
pkgrel=1
pkgdesc="a MediaManager for XBMC. Information about Movies, TV Shows and Concerts are stored as nfo files. Fanarts are downloaded automatically from fanart.tv"
arch=('x86_64' 'i686')
url="http://mediaelch.kvibes.net/"
license=('GPL')
depends=('qt')
makedepends=()
_gitversion="add5259e4c6f902f4099163c516e76cae7d7ee4a"
source=("https://github.com/Komet/MediaElch/archive/$_gitversion.tar.gz")
sha256sums=('4dd0a4dd80e8b931fec546d387073dacaa008c0542691de0ab73fde0f41a17a6')

build() {
  cd "$srcdir/MediaElch-$_gitversion/"
  qmake && make
}

package() {
  cd "$srcdir/MediaElch-$_gitversion/"
  make INSTALL_ROOT="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
