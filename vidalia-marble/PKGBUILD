# Contributor: Rorschach <r0rschach@lavabit.com>

pkgname=vidalia-marble
pkgver=0.2.7
pkgrel=1
pkgdesc="Controller GUI for Tor with experimental marble-map support"
url="http://vidalia-project.net"
arch=('i686' 'x86_64')
license="GPL"
depends=('qt>=4.2.0' 'tor>=0.2.0.34' 'marble-vidalia>=4029')
makedepends=('cmake>=2.4.0' 'marble-vidalia>=4029')
conflicts=('vidalia')
source=(https://www.torproject.org/vidalia/dist/vidalia-$pkgver.tar.gz arch_menuicon.patch vidalia.png)
md5sums=('71fd5c040d7b20536d5226915c49e89a' '5db6ee2f5599cc7a4e94de20a2a3972d' '5ec703cf17d75f880b2494495a5d2a58')

build() {
  [ -f /etc/profile.d/qt4.sh ] && source /etc/profile.d/qt4.sh

  patch -p0 < ../arch_menuicon.patch
  cd vidalia-$pkgver
  make clean
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
 	-DUSE_MARBLE=1 \
        -DMARBLE_INCLUDE_DIR=/usr/include/marble \
        -DMARBLE_DATA_DIR=/usr/share/marble/data \
        -DMARBLE_LIBRARY_DIR=/usr/lib/marble \
        -DMARBLE_PLUGIN_DIR=/usr/lib/marble/plugins .
  make || return 1
  make DESTDIR=$pkgdir install
  install -Dm644 doc/vidalia.1.in $pkgdir/usr/share/man/man1/vidalia.1
  install -Dm644 $srcdir/vidalia.png $pkgdir/usr/share/pixmaps/vidalia.png
}
