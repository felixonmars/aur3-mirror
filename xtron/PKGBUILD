# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=xtron
pkgver=1.1a
pkgrel=1
pkgdesc="Classical version of the Tron game for X11"
arch=('i686' 'x86_64')
url="http://happypenguin.org/show?XTron"
license=('GPL')
depends=('libx11' 'libxpm')
source=("http://www.ibiblio.org/pub/Linux/games/arcade/${pkgname}-${pkgver}.tgz")
md5sums=('1f15c9cb5a03ac740d62cea3f876da60')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i "s_<xpm.h>_\"X11/xpm.h\"_g" xpm2pixmap.h
  sed -i "s_/usr/X11/lib/X11/app-defaults/xtronrc_/etc/xtron/xtronrc_g" resource.c
  sed -i "s_./pixmaps/_/usr/share/xtron/pixmaps/_g" xtronrc
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install binary
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Install configuration file
  install -Dm644 xtronrc "${pkgdir}/etc/${pkgname}/xtronrc"

  # Install data files
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -rf pixmaps/ "${pkgdir}/usr/share/${pkgname}/"

  # Install doc files
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  cp -rf CHANGES INSTALL README "${pkgdir}/usr/share/doc/${pkgname}/"
}
