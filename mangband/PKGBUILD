# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Aaron Fellin <adfellin@cs.pdx.edu>

pkgname=mangband
pkgver=1.1.2
pkgrel=1
pkgdesc="A free online multiplayer real-time roguelike game, derived from Angband"
arch=('i686' 'x86_64')
url="http://www.mangband.org/"
license=('custom')
depends=('ncurses' 'sdl')
install="${pkgname}.install"
source=("http://mangband.org/download/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.patch")
md5sums=('f6bf8d8fb0533c94e2f520d53b0815b0'
         'ef26da35a55fbfb651c404d2253a53b7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"

  patch -Np2 -i "../../${pkgname}.patch"
  ./configure
  LDFLAGS="-lm" make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install game files
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r lib *.{INI,cfg} "${pkgdir}/opt/${pkgname}"
  install -m755 mangband mangclient runserv "${pkgdir}/opt/${pkgname}"
  find "${pkgdir}/opt/${pkgname}/lib" -name delete.me -delete

  # Set permissions
  chgrp -R games "${pkgdir}/opt/${pkgname}"
  chmod -R g+w "${pkgdir}/opt/${pkgname}"

  # Install launchers
  mkdir -p "${pkgdir}/usr/bin"
  echo "cd /opt/${pkgname} && ./mangband \"\$@\"" > "${pkgdir}/usr/bin/mangband"
  echo "cd /opt/${pkgname} && ./mangclient \"\$@\"" > "${pkgdir}/usr/bin/mangclient"
  echo "cd /opt/${pkgname} && ./runserv \"\$@\"" > "${pkgdir}/usr/bin/mangrunserv"
  chmod 755 "${pkgdir}/usr/bin/"*

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
