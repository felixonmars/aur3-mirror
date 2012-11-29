# Maintainer: Matt Harrison <matt@mistbyte.com>
# This PKGBUILD is maintained at https://github.com/matt-h/mediaelch-pkgbuild

pkgname=mediaelch
pkgver=1.2
pkgrel=2
pkgdesc="a MediaManager for XBMC. Information about Movies, TV Shows and Concerts are stored as nfo files. Fanarts are downloaded automatically from fanart.tv"
arch=('x86_64' 'i686')
url="http://mediaelch.kvibes.net/"
license=('GPL')
depends=('qt' 'libmediainfo' 'libzen')
makedepends=()
_gitversion="f41e1ba826954e6caa8db98ee27ca557cc38d3ad"
source=("https://github.com/Komet/MediaElch/archive/$_gitversion.tar.gz")
sha256sums=('a61340d94f8d920a869cba07cd1160e85c8df5f4a11bea544f2b0aec0bc178be')

build() {
  cd "$srcdir/MediaElch-$_gitversion/"
  qmake && make
}

package() {
  cd "$srcdir/MediaElch-$_gitversion/"
  make INSTALL_ROOT="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
