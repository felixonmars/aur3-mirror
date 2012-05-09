# $Id: PKGBUILD 152781 2012-03-09 16:19:36Z andyrtr $
# Maintainer: Jan de Groot <jgc@archlinux.org>

_pkgbasename=libxkbfile
pkgname=lib32-libxkbfile
pkgver=1.0.8
pkgrel=1
pkgdesc="X11 keyboard file manipulation library (32-bit)"
arch=('x86_64')
license=('custom')
url="http://xorg.freedesktop.org/"
depends=('lib32-libx11' "${_pkgbasename}")
makedepends=('xorg-util-macros')
options=('!libtool')
source=("${url}/releases/individual/lib/${_pkgbasename}-${pkgver}.tar.bz2")
sha1sums=('05139829837c26e3a14a40a700f058c018bc71f5')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  ./configure --prefix=/usr --libdir=/usr/lib32 --sysconfdir=/etc --disable-static 
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share}

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s ${_pkgbasename} "${pkgdir}/usr/share/licenses/${pkgname}"
}
