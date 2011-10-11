# Maintainer: Vadym Abramchuk <abramm@gmail.com>

pkgname=php-ctpp2
pkgver=2.6.0
pkgrel=3
pkgdesc='CTPP (or CT++) is the fastest template engine which completely written in C++'
arch=(i686 x86_64)
url='http://ctpp.havoc.ru/en/'
depends=(php ctpp2)
makedepends=(cmake make)
source=("http://ctpp.havoc.ru/download/php-ctpp2-$pkgver.tar.gz")
license=('custom:BSD-like')
md5sums=('64626fe9a94f49900280f0eaf7ee4cd4')
sha256sums=('52d609310309249b0d13b8bc8f819dc136ec57b11e4c04218e9a387d21cd5525')
_srcdir="$srcdir/$pkgname-$pkgver"

build() {
  cd "$_srcdir"
  phpize
  ./configure
  make VERBOSE=1
  make INSTALL_ROOT="$pkgdir" install
}

