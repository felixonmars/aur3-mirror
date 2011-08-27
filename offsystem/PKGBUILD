# Contributor: Stewart Starbuck <s.starbuck@theownerfreelibrary.org>
pkgname=offsystem
pkgver=0.19.34
pkgrel=1
pkgdesc="A distributed filesystem in which files are stored in reference to randomized blocks"
arch=('i686' 'x86_64')
url="http://offsystem.sf.net"
license=('GPL')
conflicts=('offsystem_headless')
depends=('wxgtk' 'openssl' 'libpng' 'libjpeg' 'libtiff')
source=(http://downloads.sourceforge.net/sourceforge/offsystem/OFFSystem-$pkgver-src.tar.gz)
md5sums=(ad287a6f524eb42b8b426ad24b68e251)
build() {
  cd "$srcdir/off_network/build_gtk"
  make release || return 1
  make DESTDIR="$pkgdir" install
}
