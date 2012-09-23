# $Id: PKGBUILD 68500 2012-03-26 09:34:30Z pschmitz $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
_pkgbasename=libxcursor
pkgname=libx32-$_pkgbasename
pkgver=1.1.13
pkgrel=1.1
pkgdesc="X cursor management library (x32 ABI)"
arch=(x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libx32-libxfixes' 'libx32-libxrender' $_pkgbasename)
makedepends=('xorg-util-macros' gcc-multilib)
options=('!libtool')
source=(${url}/releases/individual/lib/libXcursor-${pkgver}.tar.bz2)
sha1sums=('4e461d9e4324689ca8a84706926a8c0fe9470e47')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd "${srcdir}/libXcursor-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static --libdir=/usr/libx32
  make
}

package() {
  cd "${srcdir}/libXcursor-${pkgver}"

  make DESTDIR=${pkgdir} install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
