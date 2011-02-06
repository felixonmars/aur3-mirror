# Contributor: fancris3 <fancris3 at aol.com>
pkgname=pretendroot
pkgver=0.9
pkgrel=1
pkgdesc="Pretendroot is an LD_PRELOAD library which overrides some glibc calls, \
fakeroot alternative"
arch=(i686 x86_64)
url="http://freshmeat.net/projects/pretendroot/"
license=('GPL')
depends=()
source=(ftp://ftp.uhulinux.hu/pub/sources/pretendroot/$pkgname-$pkgver.tar.gz)
md5sums=('7370af045263c51a6d2e7a86f4c6915f')

build() {
  cd ${pkgname}-${pkgver}
  [ "$CARCH" = "x86_64" ] && sed -i "s|-ldl|-ldl -fPIC|g" Makefile
  make || return 1
  install -D -m755 pretendroot $startdir/pkg/usr/bin/pretendroot
  install -D -m644 libpretendroot.so $startdir/pkg/usr/lib/libpretendroot.so
}
