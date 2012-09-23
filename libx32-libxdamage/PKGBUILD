# $Id: PKGBUILD 64003 2012-02-08 18:54:32Z pschmitz $
# Maintainer: Jan de Groot <jgc@archlinux.org>

_pkgbasename=libxdamage
pkgname=libx32-$_pkgbasename
pkgver=1.1.3
pkgrel=4.1
pkgdesc="X11 damaged region extension library (x32 ABI)"
arch=(x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libx32-libxfixes>=4.0.4' $_pkgbasename)
makedepends=('pkg-config' 'damageproto>=1.2.0' gcc-multilib-x32)
options=('!libtool')
source=(${url}/releases/individual/lib/libXdamage-${pkgver}.tar.bz2)
sha1sums=('7d96e8de107fede16951cb47d5e147630fbc7dee')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd "${srcdir}/libXdamage-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static --libdir=/usr/libx32
  make
}

package() {
  cd "${srcdir}/libXdamage-${pkgver}"

  make DESTDIR="${pkgdir}" install || return 1
  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
