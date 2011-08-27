pkgname=libber
pkgver=0.4.2
pkgrel=1
pkgdesc="This library is an implementation of the ITU-T X.690 specification of Basic Encoding Rules (BER)"
arch=(i686 x86_64)
url="http://packages.debian.org/unstable/libs/libber0"
depends=('glibc')
makedepends=('gcc')
license=('BSD')
source=("http://ftp.debian.org/debian/pool/main/libb/libber/libber_$pkgver.tar.gz")

build() {
  cd $startdir/src/libber-$pkgver
  make
  make install DESTDIR=$startdir/pkg/ prefix=$startdir/pkg/usr
  mkdir -p $startdir/pkg/usr/share/licenses/$pkgname/
  cp $startdir/src/libber-$pkgver/debian/copyright \
     $startdir/pkg/usr/share/licenses/$pkgname/
}
md5sums=('a5cef8fb4df10f601d8f226f414ea150')
