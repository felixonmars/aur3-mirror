# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=xdigger
pkgver=1.0.10
pkgrel=2
pkgdesc="A Boulder Dash clone that was ported from KC85 to Unix/X11"
arch=('i686' 'x86_64')
url="http://www.happypenguin.org/show?XDigger"
license=('GPL')
depends=('libxext')
makedepends=('imake')
install="${pkgname}.install"
source=("http://www.ibiblio.org/pub/Linux/games/arcade/${pkgname}-${pkgver}.tgz"
        "install-paths.patch"
        "${pkgname}.desktop")
md5sums=('74959b5c3f0ba47d1f25f515438c86ab'
         'fdbb72706613296a7d18695c813a3977'
         '97192e3e437f9affd4d0c9545de9135b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -Np1 -i ../install-paths.patch

  xmkmf
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install install.man

  # Fix permissions for the scores file
  chmod 664 "${pkgdir}/var/lib/${pkgname}/${pkgname}.hiscore"
  chgrp games "${pkgdir}/var/lib/${pkgname}/${pkgname}.hiscore"

  # Install a desktop entry
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
