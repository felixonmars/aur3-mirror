# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=kicad-arduino-shield-modules
pkgver=3
pkgrel=1
pkgdesc="Kicad libraries for arduino shields"
arch=('any')
url="http://www.thingiverse.com/thing:9630"
license=('CCPL:by-3.0')
depends=('kicad')
install=
changelog=
source=(http://www.thingiverse.com/download:30433 http://www.thingiverse.com/download:30434 http://www.thingiverse.com/download:30436 http://www.thingiverse.com/download:30437)
noextract=()
md5sums=('597523d3cb3c94434f38cd5be1b42656'
         '10dd57ecdc0df374ca75aaaff0c620c1'
         '20609a3b9cda49b4622d8fd0d68adc5d'
         'e5a9decc7c1982f3eb4bba6f5606c6f5')

package() {
  installdir="${pkgdir}/usr/share/kicad/"
  cd "$srcdir/"
  install -dm755 "${installdir}library/" "${installdir}modules/" "${installdir}modules/packages32/arduino shields/"
  install -Dm755 download:30433 "${installdir}modules/arduino_shields.mod" 
  install -Dm755 download:30434 "${installdir}library/arduino_shieldsNCL.lib"
  install -Dm755 download:30436 "${installdir}modules/packages32/arduino_shields/ArduinoMegaShield.wrl"
  install -Dm755 download:30437 "${installdir}modules/packages32/arduino_shields/ArduinoMegaShield.wings "
}

# vim:set ts=2 sw=2 et:
