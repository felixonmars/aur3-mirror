# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>

pkgname=multitee
pkgver=3.0
pkgrel=1
pkgdesc="Sends all input on file descriptor fdin to each descriptor fdout."
arch=('i686' 'x86_64')
url="http://cr.yp.to/djb.html"
license=('custom')
depends=(glibc)
source=(http://cr.yp.to/software/$pkgname-$pkgver.shar.gz
        Makefile
        LICENSE)
md5sums=('a67f335b47a33f4fbc4a1efa30256de0'
         '98cf8017d3b38682ae9497ff12a351a2'
         '026744ba6e67e3204c0a32fefda37dc0')

build() {
  mkdir -p $srcdir/$pkgname-$pkgver
  cd $srcdir/$pkgname-$pkgver

  sed -i '1,35d' ../$pkgname-$pkgver.shar
  sh ../$pkgname-$pkgver.shar
  cp ../Makefile .

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make PREFIX=/usr DESTDIR=$pkgdir install
  install -Dm0644 ../LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
