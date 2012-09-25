# $Id: PKGBUILD 64031 2012-02-08 18:59:51Z pschmitz $
# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>

_pkgbasename=speex
pkgname=libx32-$_pkgbasename
pkgver=1.2rc1
pkgrel=4.1
pkgdesc="A free codec for free speech (x32 ABI)"
arch=(x86_64)
license=('BSD')
depends=('libx32-libogg' $_pkgbasename)
makedepends=(gcc-multilib-x32)
options=('!libtool')
source=(http://downloads.us.xiph.org/releases/$_pkgbasename/$_pkgbasename-$pkgver.tar.gz)
md5sums=('c4438b22c08e5811ff10e2b06ee9b9ae')
url="http://www.speex.org/"

build() {
  cd $srcdir/speex-$pkgver

  export CC="gcc -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libdir=/usr/libx32
  make
}

package() {
  cd $srcdir/speex-$pkgver
  make DESTDIR=$pkgdir install
  rm -rf "${pkgdir}"/usr/{include,share,bin}
}
