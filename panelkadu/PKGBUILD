# Maintainer: FadeMind <fademind@gmail.com>

pkgname=panelkadu
pkgver=1.0_11
pkgrel=4
_customname=ultr-kadu-plugins-panelkadu
pkgdesc='Panelkadu plugin for Kadu IM'
arch=('i686' 'x86_64')
url='http://www.kadu.im/w/Panelkadu'
license=('GPL')
depends=('kadu>=1.0')
makedepends=('cmake' 'chrpath')
source=("$pkgname-$pkgver.tar.gz"::'https://gitorious.org/ultr-kadu-plugins/panelkadu/archive/bc51bcbc9dabaf026733764efebf571bbee5f499.tar.gz')
sha256sums=('a68bcf11a43fabd2aef7f6e05eb211b4838ff3843013596327d694241b7fa481')

build() {
   mkdir build
   cd build
 
   cmake ../$_customname \
     -DCMAKE_BUILD_TYPE=Release \
     -DCMAKE_INSTALL_PREFIX=/usr \
     -DCMAKE_INSTALL_LIBDIR=/usr/lib \
     -DQT_QMAKE_EXECUTABLE=qmake-qt4
}

package() {
   make -C build DESTDIR="$pkgdir" LIBDIR=/usr/lib install
   chrpath -d "$pkgdir"/usr/lib/kadu/plugins/*.so
}
