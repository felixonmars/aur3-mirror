# $Id: PKGBUILD 79902 2012-11-14 16:17:37Z bluewind $
# Upstream Maintainer : Ionut Biru <ibiru@archlinux.org>
# Maintainer: Fantix King <fantix.king at gmail.com>
_pkgbasename=pixman
pkgname=libx32-$_pkgbasename
pkgver=0.28.0
pkgrel=1.1
pkgdesc="Pixman library (x32 ABI)"
arch=('x86_64')
url="http://xorg.freedesktop.org"
license=('custom')
depends=('libx32-glibc' $_pkgbasename)
makedepends=('gcc-multilib-x32')
options=('!libtool')
source=(http://xorg.freedesktop.org/releases/individual/lib/${_pkgbasename}-${pkgver}.tar.bz2)
sha1sums=('cfc7a18a8811bf4ff0890f547c315bda8097f6ad')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  ./configure --prefix=/usr --libdir=/usr/libx32 --disable-static
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/include
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
