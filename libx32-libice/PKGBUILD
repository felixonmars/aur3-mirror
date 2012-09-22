# $Id: PKGBUILD 68121 2012-03-18 14:14:19Z lcarlier $
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

_pkgbasename=libice
pkgname=libx32-$_pkgbasename
pkgver=1.0.8
pkgrel=1.1
pkgdesc="X11 Inter-Client Exchange library (x32 ABI)"
arch=(x86_64)
url="http://xorg.freedesktop.org/"
depends=('libx32-glibc' $_pkgbasename)
makedepends=('pkgconfig' 'xtrans>=1.2.5' 'gcc-multilib-x32')
options=('!libtool')
source=(${url}/releases/individual/lib/libICE-${pkgver}.tar.bz2)
license=('custom')
sha1sums=('ddb14df8bbc43df7322978f5f9f802936e2a7324')

build() {
  cd "${srcdir}/libICE-${pkgver}"

  export CC="gcc -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  ./configure --prefix=/usr --sysconfdir=/etc --libdir=/usr/libx32

  make
}

package() {
  cd "${srcdir}/libICE-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share}

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname" 
}
