# $Id: PKGBUILD 68125 2012-03-18 14:23:35Z lcarlier $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

_pkgbasename=libxinerama
pkgname=libx32-$_pkgbasename
pkgver=1.1.2
pkgrel=1.1
pkgdesc="X11 Xinerama extension library (x32 ABI)"
arch=(x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libx32-libxext' $_pkgbasename)
makedepends=('xorg-util-macros' gcc-multilib-x32)
options=(!libtool)
source=(${url}/releases/individual/lib/libXinerama-${pkgver}.tar.bz2)
sha1sums=('06a5b636305725ce09f6c3a4d5a15f2f188b5afd')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd "${srcdir}/libXinerama-${pkgver}"
  ./configure --prefix=/usr --libdir=/usr/libx32
  make
}

package() {
  cd "${srcdir}/libXinerama-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
