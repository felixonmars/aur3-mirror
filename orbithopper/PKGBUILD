# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=orbithopper
pkgver=1.16c
_pkgver=116c
pkgrel=2
pkgdesc="A SkyRoads clone featuring new levels, enemies and much more"
arch=('i686' 'x86_64')
url="http://www.zneaker.com/joomla/"
license=('GPL')
depends=('mesa' 'sdl_image' 'sdl_mixer')
install="${pkgname}.install"
source=("http://www.zneaker.com/down/${pkgname}${_pkgver}.tar.gz"
        "${pkgname}.desktop")
md5sums=('7f56580f621dbb45a6772bbb6fbd65c0'
         'e304f8681604284cb57149add7bfa516')

build() {
  cd "${srcdir}"
  make
}

package() {
  cd "${srcdir}"

  # Install game files
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r gfx maps shaders sounds "${pkgdir}/opt/${pkgname}"

  find "${pkgdir}/opt" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/opt" -type f -exec chmod 644 '{}' \;

  chgrp -R games "${pkgdir}/opt/${pkgname}/maps"
  chmod -R g+w "${pkgdir}/opt/${pkgname}/maps"

  install -m755 OrbitHopper.x "${pkgdir}/opt/${pkgname}"
  install -m664 -g games *.ini "${pkgdir}/opt/${pkgname}"

  # Install a launcher
  echo "cd /opt/${pkgname} && ./OrbitHopper.x" > ${pkgname}
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"

  # Install a desktop entry
  install -Dm644 gfx/comic/tex1.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 *.{pdf,txt} "${pkgdir}/usr/share/doc/${pkgname}"
}
