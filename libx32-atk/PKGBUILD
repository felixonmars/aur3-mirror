# $Id: PKGBUILD 79191 2012-10-31 10:59:56Z lcarlier $
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Upstream Maintainer: Mikko Seppälä <t-r-a-y@mbnet.fi>
# Maintainer: Fantix King <fantix.king at gmail.com>

_pkgbasename=atk
pkgname=libx32-$_pkgbasename
pkgver=2.6.0
pkgrel=1.1
pkgdesc="A library providing a set of interfaces for accessibility (x32 ABI)"
arch=('x86_64')
license=('LGPL')
depends=('libx32-glib2>=2.25.17' $_pkgbasename)
makedepends=('gcc-multilib-x32')
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgbasename}/${pkgver%.*}/${_pkgbasename}-${pkgver}.tar.xz)
url='http://www.gtk.org/'
sha256sums=('eff663f90847620bb68c9c2cbaaf7f45e2ff44163b9ab3f10d15be763680491f')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  ./configure --prefix=/usr --libdir=/usr/libx32 \
    --disable-introspection
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share}
}
