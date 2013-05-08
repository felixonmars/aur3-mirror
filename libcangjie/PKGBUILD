# Maintainer: Antony Ho <ntonyworkshop@gmail.com>
pkgname=libcangjie
pkgver=0.0.1a
pkgrel=1
pkgdesc="CangJie Input Method Library"
arch=('x86_64' 'i686')
url="https://github.com/wanleung/libcangjie"
license=('LGPL3')
depends=('db')
makedepends=()  
replaces=('libcangjie-git')
sha1sums=('1b5b2140bfeb987b9cfcd36b0e5e6b608841da9a' 'SKIP')
source=("http://www.wanleung.com/$pkgname/$pkgname-$pkgver.tar.xz" "0001-classicfreq-Rebuild-the-freq-data-with-the-latest-sc.patch")

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ../0001-classicfreq-Rebuild-the-freq-data-with-the-latest-sc.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
