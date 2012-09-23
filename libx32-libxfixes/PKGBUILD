# $Id: PKGBUILD 60947 2011-12-19 19:00:33Z bluewind $
#Maintainer: Jan de Groot <jgc@archlinux.org>

_pkgbasename=libxfixes
pkgname=libx32-$_pkgbasename
pkgver=5.0
pkgrel=1.1
pkgdesc="X11 miscellaneous 'fixes' extension library (x32 ABI)"
arch=('x86_64')
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libx32-libx11' $_pkgbasename)
makedepends=('pkg-config' gcc-multilib-x32 )
options=('!libtool')
source=(${url}/releases/individual/lib/libXfixes-${pkgver}.tar.bz2)
sha1sums=('3e4d374e9026111a04cd669d4b3434273fc34fe0')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd "${srcdir}/libXfixes-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static --libdir=/usr/libx32
  make
}

package() {
  cd "${srcdir}/libXfixes-${pkgver}"
  make DESTDIR="${pkgdir}" install
 
  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
