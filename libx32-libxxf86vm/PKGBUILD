# $Id: PKGBUILD 68127 2012-03-18 14:27:23Z lcarlier $
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbasename=libxxf86vm
pkgname=libx32-$_pkgbasename
pkgver=1.1.2
pkgrel=1.1
pkgdesc="X11 XFree86 video mode extension library (x32 ABI)"
arch=('x86_64')
license=('custom')
url="http://xorg.freedesktop.org/"
depends=('libx32-libxext' $_pkgbasename)
makedepends=('xorg-util-macros' gcc-multilib-x32)
options=('!libtool')
source=(${url}/releases/individual/lib/libXxf86vm-${pkgver}.tar.bz2)
sha1sums=('57bbf3bb69a49f6a6dec515813394a383f85502f')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd "${srcdir}/libXxf86vm-${pkgver}"
  ./configure --prefix=/usr --disable-static \
    --libdir=/usr/libx32
  make
}

package() {
  cd "${srcdir}/libXxf86vm-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
