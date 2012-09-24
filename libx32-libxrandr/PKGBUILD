# $Id: PKGBUILD 75217 2012-08-16 11:10:33Z bluewind $
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
_pkgbasename=libxrandr
pkgname=libx32-$_pkgbasename
pkgver=1.4.0
pkgrel=1.1
pkgdesc="X11 RandR extension library (x32 ABI)"
arch=('x86_64')
license=('custom')
url="http://xorg.freedesktop.org/"
depends=('libx32-libxext' 'libx32-libxrender' $_pkgbasename)
makedepends=('xorg-util-macros' gcc-multilib-x32)
options=('!libtool')
source=(${url}/releases/individual/lib/libXrandr-${pkgver}.tar.bz2)
sha256sums=('033ad0ac2f012afb05268660f6d78705c85f84689f92fa7b47ce12959b15f5c3')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd "${srcdir}/libXrandr-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --libdir=/usr/libx32
  make
}

package() {
  cd "${srcdir}/libXrandr-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
