# Maintainer: karnath <karnathtorjian@gmail.com>

pkgname=sn
pkgver=0.3.8
pkgrel=2
pkgdesc="A small news system for small sites."
arch=(i686 x86_64)
url="http://infa.abo.fi/~patrik/sn"
license=("GPL")
depends=('zlib' 'bash')
install="$pkgname.install"
source=($url/files/$pkgname-$pkgver.tar.bz2)
md5sums=('157276c0ef8adff5031b0d3950b5a32f')

build() {
  cd $srcdir/$pkgname-$pkgver
  sed -i "s:-g -Wall -pedantic -O:${CFLAGS}:" Makefile
  make PREFIX=/usr || return 1
  mkdir -p $pkgdir/{usr/{man/man8,sbin},var/spool/news}
  make PREFIX=$pkgdir/usr install
  mknod -m 600 $pkgdir/var/spool/news/.fifo p
}
