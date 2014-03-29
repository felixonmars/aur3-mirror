# Maintainer: Reuben Castelino  <projectdelphai[at]gmail[dot]com>
pkgname=hnefatafl
pkgver=0.1.3
pkgrel=1
pkgdesc="A viking game"
arch=('any')
url="https://github.com/projectdelphai/hnefatafl"
license=('GPL')
depends=('qt5-base')
source=(https://github.com/projectdelphai/$pkgname/archive/$pkgver.tar.gz)
noextract=()
md5sums=('42378149a9e8b5906c2098f0ec70fef7')

build() {
  cd $pkgname-$pkgver
  mkdir -p tmp
  make
}

package() {
  cd $pkgname-$pkgver
  mkdir -p $pkgdir/usr/bin
  install -m755 release/$pkgname $pkgdir/usr/bin/$pkgname
  mkdir -p $pkgdir/usr/lib
  install -m755 release/libjson_linux-gcc-4.8.2_libmt.so $pkgdir/usr/lib/libjson_linux-gcc-4.8.2_libmt.so
  mkdir -p $pkgdir/$HOME
  install -m755 release/hnefatafl-data $pkgdir$HOME/.hnefatafl-data
}
