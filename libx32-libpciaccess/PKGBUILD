# $Id: PKGBUILD 69229 2012-04-10 16:20:11Z lcarlier $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

_pkgbasename=libpciaccess
pkgname=libx32-${_pkgbasename}
pkgver=0.13.1
pkgrel=1.1
pkgdesc="X11 PCI access library (x32 ABI)"
arch=(x86_64)
license=('custom')
url="http://xorg.freedesktop.org/"
depends=('libx32-glibc' ${_pkgbasename})
makedepends=('gcc-multilib-x32' 'pkgconfig' 'xorg-util-macros')
options=('!libtool')
source=(${url}/releases/individual/lib/${_pkgbasename}-${pkgver}.tar.bz2)
sha1sums=('ae4dcf27a1b52c6a1fd90b21165fbaecae34e8ac')

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  ./configure --prefix=/usr --sysconfdir=/etc \
    --libdir=/usr/libx32
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/include
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
