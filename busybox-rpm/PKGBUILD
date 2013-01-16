# Maintainer: Daniel YC Lin <dlin.tw at gmail>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jens Pranaitis <jens@jenux.homelinux.org>

pkgname=busybox-rpm
_pkgname=busybox
pkgver=1.20.2
pkgrel=3
pkgdesc="Utilities for rescue and embedded systems with rpm enabled"
arch=("i686" "x86_64")
url="http://www.busybox.net"
license=('GPL')
makedepends=("make" "gcc" "sed" "ncurses")
source=($url/downloads/$_pkgname-$pkgver.tar.bz2
	config)
install=busybox.install
md5sums=('e025414bc6cd79579cc7a32a45d3ae1c'
         '09d4562ee4a9ab5415be44b945bfc7e2')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  cp $srcdir/config .config
  sed '1,1i#include <sys/resource.h>' -i include/libbb.h
  # if you want to run menuconfig uncomment the following line:
#  make menuconfig ; return 1
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 busybox $pkgdir/bin/busybox
  ln -s busybox $pkgdir/bin/rpm
}
md5sums=('e025414bc6cd79579cc7a32a45d3ae1c'
         '28db2c41e0423f471c9e7206849436b9')
