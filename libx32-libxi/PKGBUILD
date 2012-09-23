# $Id: PKGBUILD 70676 2012-05-14 16:09:11Z bluewind $
# Maintainer: Jan de Groot <jgc@archlinux.org>

_pkgbasename=libxi
pkgname=libx32-$_pkgbasename
pkgver=1.6.1
pkgrel=1.1
pkgdesc="X11 Input extension library (x32 ABI)"
arch=('x86_64')
url="http://xorg.freedesktop.org"
depends=('libx32-libxext' 'inputproto' $_pkgbasename)
makedepends=('pkgconfig' 'xorg-util-macros' gcc-multilib-x32)
options=(!libtool)
license=('custom')
source=(${url}/releases/individual/lib/libXi-${pkgver}.tar.bz2)
sha1sums=('4b53b41fdaa3acc86606c696c68d5eed11454612')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd "${srcdir}/libXi-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static \
    --libdir=/usr/libx32
  make
}

package() {
  cd "${srcdir}/libXi-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
