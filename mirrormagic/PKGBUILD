# Contributor: Simon Bachmann <simonbachmann@freesurf.ch>
# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>

pkgname=mirrormagic
pkgver=2.0.2
pkgrel=4
pkgdesc="Arcade style game like "Deflektor" (C 64) or "Mindbender" (Amiga)"
arch=('i686' 'x86_64')
url="http://www.artsoft.org/mirrormagic/"
license=('GPL2')
depends=('sdl_image' 'sdl_mixer')

source=("http://www.artsoft.org/RELEASES/unix/mirrormagic/${pkgname}-${pkgver}.tar.gz"
        "main_h.diff"
        "mirrormagic.desktop")

md5sums=('32fd3909c1e27f493d89bc2276da6744'
         '6722c4b1b9e2e0db71014c75c1369c03'
         '0c7628c7bf19dd20eb018043e50d6997')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  #fix an error in main.h
  patch -p1 < "${srcdir}/main_h.diff"
  #compile...
  make RO_GAME_DIR="/usr/share/${pkgname}" RW_GAME_DIR=~/.${pkgname} sdl
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # copy main files
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  cp -r graphics levels music scores sounds "${pkgdir}/usr/share/${pkgname}"

  # copy documentation
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 CHANGES CREDITS INSTALL README TODO "${pkgdir}/usr/share/doc/${pkgname}"

  # install exec-file
  install -D -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # install desktop entry file
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # fix permissions
  cd "${pkgdir}/usr/share/${pkgname}/"
  find . -type f -exec chmod 644 {} \;
}

# vim:set ts=2 sw=2 et:
