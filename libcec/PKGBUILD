# Maintainer: Philippe Cherel <philippe.cherel at mayenne dot org>

pkgname=libcec
pkgver=1.5.1
pkgrel=1
pkgdesc="Pulse-Eight's libcec for the Pulse-Eight USB-CEC adapter"
arch=('i686' 'x86_64')
url="https://github.com/Pulse-Eight/libcec"
license=('GPL')
depends=('udev>=151' 'glibc' 'gawk' 'autoconf>=2.13' 'automake>=1.11' 'pkg-config' 'gcc>=4.2')
provides=('libcec')
source=(https://github.com/Pulse-Eight/libcec/tarball/libcec-1.5.1/Pulse-Eight-libcec-libcec-1.5.1-0-g0eb7639.tar.gz)
md5sums=('cdc45ea619e1aa1e31f5ae9e850df679')

build() {
  mv "$srcdir/Pulse-Eight-libcec-0eb7639" "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf -vif
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
