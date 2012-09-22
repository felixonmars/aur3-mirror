# $Id: PKGBUILD 70680 2012-05-14 16:17:11Z bluewind $
# Maintainer: Ionut Biru <ibiru@archlinux.org>

_pkgbasename=cairo
pkgname=libx32-$_pkgbasename
pkgver=1.12.2
pkgrel=1.1
pkgdesc="Cairo vector graphics library (x32 ABI)"
arch=('x86_64')
url="http://cairographics.org/"
license=('LGPL' 'MPL')
depends=('libx32-libpng' 'libx32-libxrender' 'libx32-fontconfig'
         'libx32-pixman' 'libx32-glib2' ${_pkgbasename})
makedepends=('gcc-multilib-x32')
source=(http://cairographics.org/releases/${_pkgbasename}-${pkgver}.tar.xz
cairo-1.10.0-buggy_gradients.patch)
md5sums=('87649eb75789739d517c743e94879e51'
         '9b323790dab003e228c6955633cb888e')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  autoreconf -vfi

  ./configure --prefix=/usr --libdir=/usr/libx32 \
      --sysconfdir=/etc  --localstatedir=/var \
      --disable-static --enable-tee --disable-xlib-xcb --disable-full-testing
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share,bin}
}
