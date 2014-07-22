# Maintainer : Kaushal M <kshlmster at gmail dot com>

pkgname=cmockery2
pkgver=1.3.8
pkgrel=1
pkgdesc="Lightweight C unit testing framework"
arch=(i686 x86_64)
url="https://gluster.com/lpabon/cmockery2"
license=(APACHE2)
source=($pkgname-$pkgver.tar.gz::https://github.com/lpabon/cmockery2/archive/v$pkgver.tar.gz)
sha256sums=('6178e2fc51653d1b15f5d7cc10e0f48adcbf6cd07c1acf793ea26bfa789e7ef7')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make -j1 DESTDIR=$pkgdir install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
