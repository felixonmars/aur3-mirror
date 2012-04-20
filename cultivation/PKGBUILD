# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=cultivation
pkgver=9
pkgrel=1
pkgdesc="A social simulation game by Jason Rohrer"
arch=('i686' 'x86_64')
url="http://cultivation.sourceforge.net/"
license=('custom:public_domain')
depends=('freeglut' 'libpng')
install="${pkgname}.install"
source=("http://downloads.sourceforge.net/${pkgname}/Cultivation_${pkgver}_UnixSource.tar.gz"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "${pkgname}.sh")
md5sums=('49245426f02f526c0509117b82b6aa8f'
         '08d73a0774f0a0db875a36822369b6cb'
         '53bfc4c4d6f7c28f21c7bd2d315fa5cc'
         '9341078c7b9a8551f5fb5dc650ef4825')

build() {
  cd "${srcdir}/Cultivation_${pkgver}_UnixSource"

  # Fix PortAudio compilation error
  mkdir minorGems/sound/portaudio/{bin,lib}

  sed -i "s_^./configure_echo 1 | ./configure_" runToBuild
  ./runToBuild
}

package() {
  cd "${srcdir}/Cultivation_${pkgver}_UnixSource"

  # Install game files
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -R languages Cultivation *.{tga,txt} "${pkgdir}/opt/${pkgname}"

  # Set permissions
  chgrp -R games "${pkgdir}/opt/${pkgname}"
  chmod -R g+w "${pkgdir}/opt/${pkgname}"

  # Install launchers
  install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  ln -s "/usr/bin/${pkgname}" "${pkgdir}/usr/bin/Cultivation"

  # Install pixmap and .desktop file
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
