# Maintainer: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=corsair
pkgver=20090623
pkgrel=1
pkgdesc="An resource downloader for the grid of Tsinghua University."
arch=('i686' 'x86_64')
url="http://corsair.thuhpc.org"
license=('custom')
depends=()
install=
source=(http://corsair.thuhpc.org/download/$pkgname-linux-$pkgver.tar.gz)
noextract=()
md5sums=('c3a568df6d0635d3a64de6432a22ffc8')

build() {
  mkdir -p $pkgdir/opt
  mv $srcdir/corsair-linux $pkgdir/opt/corsair
  mkdir -p $pkgdir/usr/bin
  cd $pkgdir/usr/bin
  ln -s ../../opt/corsair/corsair
}
