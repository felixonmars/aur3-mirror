# Contributor: Mladen Pejakovic <pejakm@gmail.com>

pkgname=libxkbcommon
pkgver=0.2.0
pkgrel=2
pkgdesc="Library to handle keyboard descriptions, needed by Wayland"
arch=(i686 x86_64)
url="http://xkbcommon.org/"
license=('custom')
depends=()
makedepends=()
options=()
source=("http://xkbcommon.org/download/${pkgname}-${pkgver}.tar.bz2")
md5sums=('2be3d4a255d02c7d46fc6a9486f21f6a')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
