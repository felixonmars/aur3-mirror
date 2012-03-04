_pkgsourcename=openssl-compatibility
pkgname=lib32-$_pkgsourcename
pkgver=0.9.8
pkgrel=5
pkgdesc="libssl and libcrypto 0.9.8 libs (32 Bit)"
url="https://www.openssl.org"
license=('GPL')
arch=(x86_64)
depends=()
source=(http://arm.konnichi.com/core/os/i686/openssl-${pkgver}n-1-i686.pkg.tar.xz)
md5sums=('b1860e7fd78210542fbb4913aa7e8eb1')


build() {
  mkdir -p $pkgdir/usr/lib32
  install -D -m555 $srcdir/usr/lib/libcrypto.so.$pkgver $pkgdir/usr/lib32 || return 1
  install -D -m555 $srcdir/usr/lib/libssl.so.$pkgver $pkgdir/usr/lib32 || return 1
}

