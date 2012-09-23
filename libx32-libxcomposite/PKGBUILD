# $Id: PKGBUILD 68123 2012-03-18 14:19:07Z lcarlier $
# Maintainer: Jan de Groot <jgc@archlinux.org>

_pkgbasename=libxcomposite
pkgname=libx32-$_pkgbasename
pkgver=0.4.3
pkgrel=3.1
pkgdesc="X11 Composite extension library (x32 ABI)"
arch=(x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libx32-libxfixes' $_pkgbasename)
makedepends=('xorg-util-macros' gcc-multilib-x32)
options=(!libtool)
source=(${url}/releases/individual/lib/libXcomposite-${pkgver}.tar.bz2)
sha1sums=('081b26b556d55e20d7956c80a2ea2854962aecec')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd "${srcdir}/libXcomposite-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static --libdir=/usr/libx32
  make
}

package() {
  cd "${srcdir}/libXcomposite-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
