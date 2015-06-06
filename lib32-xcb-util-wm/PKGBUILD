# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Andreas Radke <andyrtr@archlinux.org>

_pkgbasename=xcb-util-wm
pkgname=lib32-xcb-util-wm
pkgver=0.4.1
pkgrel=1
pkgdesc="Utility libraries for XC Binding - client and window-manager helpers for ICCCM (32-bit)"
arch=('x86_64')
url="http://xcb.freedesktop.org"
license=('custom')
depends=('lib32-libxcb>=1.7' $_pkgbasename)
makedepends=('xorg-util-macros' 'gcc-multilib')
source=("http://xcb.freedesktop.org/dist/${_pkgbasename}-${pkgver}.tar.bz2")
sha256sums=('28bf8179640eaa89276d2b0f1ce4285103d136be6c98262b6151aaee1d3c2a3f')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  ./configure --prefix=/usr --libdir=/usr/lib32 --disable-static
  make
}

check() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
