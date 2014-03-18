# Maintainer: Dominik Brzezinski <kelloco2@gmail.com>
pkgname=xonclock
pkgver=0.0.9.4
pkgrel=2
pkgdesc="X on-screen analog clock displayer with assignable skins"
url="http://xonclock.sourceforge.net/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('libpng' 'libtiff' 'libxft' 'freetype2')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('173f67305114d3eca10e9a7969b6c939')
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CFLAGS="-I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/harfbuzz -lfreetype -lXrender -lX11 -lm" LDFLAGS=-s ./configure --prefix=/usr
  make
}
