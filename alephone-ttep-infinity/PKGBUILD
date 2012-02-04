# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=alephone-ttep-infinity
pkgver=7.0
pkgrel=1
pkgdesc="Marathon:Infinity HiRes textures for use with the AlephOne engine"
arch=('any')
url="http://www.simplici7y.com/items/ttep-7-marathon-infinity"
license=('unknown')
depends=('alephone-infinity')
source=(http://www.simplici7y.com/version/file/105/TTEP_${pkgver}__M_Infinity_.zip)
md5sums=('6eece4e50ab638e17a9b53d083a452ae')

build() {
  cd "TTEP $pkgver (M Infinity)/TTEP 7 (Mi)"

  sed 's|Marathon Infinity Textures|textures|g' -i "Textures M∞"

  install -Dm644 "Textures M∞" "$pkgdir"/usr/share/alephone/scenarios/infinity/Scripts/textures_infinity
  cp -rf "Marathon Infinity Textures"/ "$pkgdir"/usr/share/alephone/scenarios/infinity/textures/

  find "$pkgdir" -type f -exec chmod 644 {} \;
}

# vim:set ts=2 sw=2 et:
