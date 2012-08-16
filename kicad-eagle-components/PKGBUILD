pkgname=kicad-eagle-components
pkgver=20080429
pkgrel=2
pkgdesc="Kicad libraries converted from Eagle."
arch=('any')
url="http://library.oshec.org/"
license=('custom')
depends=('kicad')
options=(!strip)
source=('http://library.oshec.org/compressed/all.tar.gz')
md5sums=('4f04a0573f3f2caa2dfa3c0dfcf95ced')
sha256sums=('22f6a9b938a74855a76b2f4a4786301f374a15aa6b53ee5f2a27296ec48a0bcd')

package() {
  installdir="${pkgdir}/usr/share/kicad/"

  # exclude components present in kicad-library-bzr package
  for filename in 'atmel.lib' 'ftdi.lib' 'interface.lib' 'microchip.lib' 'msp430.lib' 'philips.lib' 'texas.lib' 'connect.mod' 'divers.mod' 'led.mod'
  do

    new_filename=${filename%.*}-eagle.${filename##*.}

    mv "${srcdir}/converted/$filename" "${srcdir}/converted/${new_filename}"

  done

  install -dm755 "${installdir}library" "${installdir}modules/"
  install -Dm755 -t "${installdir}library/" ${srcdir}/converted/*.lib
  install -Dm755 -t "${installdir}modules/" ${srcdir}/converted/*.mod
}

# vim:set ts=2 sw=2 et:
