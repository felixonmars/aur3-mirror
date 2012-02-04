# Maintainer: Daniel Ehlers <danielehlers@mindeye.net>
pkgname=coin-bcp
pkgver=1.2.3
pkgrel=2
pkgdesc="BCP is a parallel framework for implementing branch, cut, and price Aalgorithms for solving mixed integer programs (MIPs)."
arch=('i686')
url="https://projects.coin-or.org/Bcp"
license=('EPL')
groups=('coin-or')
depends=('coin-utils>=2.7.1' 'coin-cgl>=0.56.2' 'coin-clp>=1.13.3')
makedepends=('coin-utils>=2.7.1' 'coin-cgl>=0.56.2' 'coin-clp>=1.13.3')
source=(http://www.coin-or.org/download/source/Bcp/Bcp-$pkgver.tgz)
md5sums=('be3a1ec9aa8f2ae4c9b13b5908eeb1c4')

build() {
  cd "$srcdir/Bcp-$pkgver"
  ./configure --prefix=/usr 
  cd "$srcdir/Bcp-$pkgver/Bcp"
  make
}

package() {
  cd "$srcdir/Bcp-$pkgver/Bcp"
  PKG_CONFIG_LIBDIR="${pkgdir}/usr/lib/pkgconfig/" \
  make DESTDIR="$pkgdir/" install
}
