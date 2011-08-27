pkgname=libdebug
pkgver=0.4.2
pkgrel=1
pkgdesc="This library contains various routines needed by many of the authors other programs. It includes utilities to aid in debugging of programs."
arch=(i686 x86_64)
url="http://packages.debian.org/unstable/libs/libdebug0"
depends=('glibc')
makedepends=('gcc')
license=('BSD')
source=("http://ftp.debian.org/debian/pool/main/libd/libdebug/libdebug_$pkgver.tar.gz")

build() {
  cd $startdir/src/libdebug-$pkgver
  make
  make install DESTDIR=$startdir/pkg/ prefix=$startdir/pkg/usr/

  mkdir -p $startdir/pkg/usr/share/licenses/$pkgname/
  cp $startdir/src/$pkgname-$pkgver/debian/copyright \
     $startdir/pkg/usr/share/licenses/$pkgname/
}
md5sums=('e1fa1d7cb38e4487947a0b2883df57d4')
