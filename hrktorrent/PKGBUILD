# Contributor: Markus Cisler <bl1nk@tlen.pl>
pkgname=hrktorrent
pkgver=0.3.5
pkgrel=3
pkgdesc="hrktorrent is a light console torrent client written in C++."
arch=('i686' 'x86_64')
license=('BSD')
url="http://50hz.ws"
depends=('libtorrent-rasterbar' 'asio' 'boost')
makedepends=()
install=hrktorrent.install
source=("http://50hz.ws/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('df2e53b0e3320e4b48afffc89539450d')

build() {
  mkdir -p ${pkgdir}/usr/bin
  cd ${srcdir}/$pkgname-$pkgver
  make || return 1
  make PREFIX="$pkgdir/usr" install
}
