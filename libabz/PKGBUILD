pkgname=libabz
pkgver=0.6.3
pkgrel=1
pkgdesc="This library contains various routines needed by many of the authors other programs."
arch=(i686 x86_64)
url="http://packages.debian.org/unstable/libs/libabz0"
depends=('glibc' 'libdebug')
makedepends=('gcc')
license=('BSD')
source=("http://ftp.debian.org/debian/pool/main/liba/libabz/libabz_$pkgver.tar.gz")

build() {
  cd $startdir/src/libabz-$pkgver
  make
  make install DESTDIR=$startdir/pkg/ prefix=$startdir/pkg/usr

  mkdir -p $startdir/pkg/usr/share/licenses/$pkgname/
  cp $startdir/src/$pkgname-$pkgver/debian/copyright \
     $startdir/pkg/usr/share/licenses/$pkgname/
}
md5sums=('e2b01154f75f18349a7436ea435df939')
