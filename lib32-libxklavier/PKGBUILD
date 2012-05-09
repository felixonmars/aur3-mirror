# $Id: PKGBUILD 156928 2012-04-23 09:09:15Z ibiru $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Arjan Timmerman <arjan@archlinux.org>

_pkgbasename=libxklavier
pkgname=lib32-libxklavier
pkgver=5.2.1
pkgrel=2
pkgdesc="High-level API for X Keyboard Extension (32-bit)"
arch=('x86_64')
license=('LGPL')
depends=('lib32-glib2' 'lib32-libxkbfile' 'lib32-libxml2' 'xkeyboard-config' 'lib32-libxi' 'iso-codes' "${_pkgbasename}")
makedepends=('gobject-introspection' 'gcc-multilib')
options=('!libtool' '!emptydirs')
url="http://gswitchit.sourceforge.net"
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgbasename}/${pkgver%.*}/${_pkgbasename}-${pkgver}.tar.xz)
sha256sums=('a7a1ca8ae493fb652e3456a6b3a0b07514447161aab41feed96b968f2d338b5e')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${_pkgbasename}-${pkgver}"
  ./configure --prefix=/usr --libdir=/usr/lib32 \
      --with-xkb-base=/usr/share/X11/xkb --disable-static
  make
}

package() {
  cd "${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share}
}
