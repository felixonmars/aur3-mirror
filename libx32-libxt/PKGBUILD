# $Id: PKGBUILD 68520 2012-03-26 10:02:09Z pschmitz $
#Maintainer: Jan de Groot <jgc@archlinux.org>

_pkgbasename=libxt
pkgname=libx32-$_pkgbasename
pkgver=1.1.3
pkgrel=1.1
pkgdesc="X11 toolkit intrinsics library (x32 ABI)"
arch=('x86_64')
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libx32-libsm' 'libx32-libx11' $_pkgbasename)
makedepends=('xorg-util-macros' 'gcc-multilib-x32')
options=('!libtool')
source=(
${url}/releases/individual/lib/libXt-${pkgver}.tar.bz2
libxt_fix_for_x32.patch
)
sha1sums=(
'2cef068bc4d7170e31b89b5c06aeaf4451a7699a'
'fb4e0a8717e23c9e9ded656aaab003b17408e84b'
)

build() {
  cd "${srcdir}/libXt-${pkgver}"

  patch -p1 -i "${srcdir}/libxt_fix_for_x32.patch"

  export CC="gcc -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  ./configure --prefix=/usr --sysconfdir=/etc --disable-static --libdir=/usr/libx32
  make
}

package() {
  cd "${srcdir}/libXt-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share}

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname" 
}
