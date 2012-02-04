# $Id: PKGBUILD 356 2008-04-18 22:56:27Z aaron $
# Contributer: Jason Chu <jchu@xentac.net>
# Maintainer: Jason Chu <jason@archlinux.org>
pkgname=sonypid
pkgver=1.9.1
pkgrel=2
pkgdesc="Sonypi Daemon"
arch=('i686' 'x86_64')
depends=('glibc' 'libxtst')
source=(http://popies.net/sonypi/$pkgname-$pkgver.tar.bz2)
md5sums=('d27cf0f34132f1b0b900bd0415a79181')
url="http://popies.net/sonypi/"
license=()

build() {
   cd $startdir/src/$pkgname-$pkgver
   make || return 1
   mkdir -p $startdir/pkg/usr/bin
   cp sonypid $startdir/pkg/usr/bin
}
