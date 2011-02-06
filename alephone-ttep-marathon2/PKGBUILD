# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=alephone-ttep-marathon2
pkgver=7.0
pkgrel=1
pkgdesc="Marathon2 HiRes textures for use with the AlephOne engine"
arch=('any')
url="http://www.simplici7y.com/items/ttep-7-marathon-2"
license=('unknown')
depends=('alephone-marathon2')
source=(http://www.simplici7y.com/version/file/104/TTEP_${pkgver}__Marathon2_.zip)
md5sums=('41d9d0d028057c73d324a4dc37ccd37c')

build() {
  cd "TTEP $pkgver (Marathon2)/TTEP 7 (M2)"

  sed 's|Marathon 2 Textures|textures|g' -i "Textures M2"

  install -Dm644 "Textures M2" "$pkgdir"/usr/share/alephone/scenarios/marathon2/Scripts/textures_marathon2
  cp -rf "Marathon 2 Textures"/ "$pkgdir"/usr/share/alephone/scenarios/marathon2/textures/

  find "$pkgdir" -type f -exec chmod 644 {} \;
}

# vim:set ts=2 sw=2 et:
