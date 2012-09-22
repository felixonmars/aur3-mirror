# $Id: PKGBUILD 70065 2012-04-29 00:54:59Z dreisner $
# Maintainer: Jan de Groot <jgc@archlinux.org>

_pkgbasename=libsm
pkgname=libx32-$_pkgbasename
pkgver=1.2.1
pkgrel=1.1
pkgdesc="X11 Session Management library (x32 ABI)"
arch=('x86_64')
license=('custom')
url="http://xorg.freedesktop.org/"
depends=('libx32-libice' 'libx32-util-linux' $_pkgbasename)
makedepends=('xorg-util-macros' 'xtrans' 'gcc-multilib-x32')
options=('!libtool')
source=(${url}/releases/individual/lib/libSM-${pkgver}.tar.bz2)
sha1sums=('8d354a165e330022ffd3606aba562b8c8154213d')

build() {
  cd "${srcdir}/libSM-${pkgver}"

  export CC="gcc -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  ./configure --prefix=/usr --sysconfdir=/etc --libdir=/usr/libx32
  make
}

package() {
  cd "${srcdir}/libSM-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share}

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname" 
}
