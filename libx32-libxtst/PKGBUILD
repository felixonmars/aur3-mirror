# $Id: PKGBUILD 68134 2012-03-18 14:37:26Z lcarlier $
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbasename=libxtst
pkgname=libx32-$_pkgbasename
pkgver=1.2.1
pkgrel=1.1
pkgdesc="X11 Testing -- Resource extension library (x32 ABI)"
arch=(x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libx32-libxext' 'libx32-libxi' $_pkgbasename)
makedepends=('gcc-multilib-x32' 'xorg-util-macros')
options=('!libtool')
source=(${url}/releases/individual/lib/libXtst-${pkgver}.tar.bz2)
sha1sums=('44e19899f9938d3db5546e51c338d6f86d88cfe2')

build() {
  cd "${srcdir}/libXtst-${pkgver}"

  export CC="gcc -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  ./configure --prefix=/usr --disable-static \
    --libdir=/usr/libx32
  make
}

package() {
  cd "${srcdir}/libXtst-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share}

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
