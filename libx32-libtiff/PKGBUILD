# $Id: PKGBUILD 77411 2012-10-09 17:13:22Z bluewind $
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

_pkgbasename=libtiff
pkgname=libx32-$_pkgbasename
pkgver=4.0.3
pkgrel=1.1
pkgdesc="Library for manipulation of TIFF images (x32 ABI)"
arch=('x86_64')
url="http://www.remotesensing.org/libtiff/"
license=('custom')
depends=('libx32-libjpeg' 'libx32-zlib' $_pkgbasename)
makedepends=(gcc-multilib-x32)
options=('!libtool')
source=(ftp://ftp.remotesensing.org/pub/libtiff/tiff-${pkgver}.tar.gz)
sha1sums=('652e97b78f1444237a82cbcfe014310e776eb6f0')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd "${srcdir}/tiff-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man --libdir=/usr/libx32 --disable-lzma
  make
}

check() {
 cd "${srcdir}/tiff-${pkgver}"
 #make check
}

package() {
  cd "${srcdir}/tiff-${pkgver}"
  make DESTDIR="${pkgdir}" install
  
  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
