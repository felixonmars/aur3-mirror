# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=alephone-ttep-marathon
pkgver=7.0
pkgrel=1
pkgdesc="Marathon HiRes textures for use with the AlephOne engine"
arch=('any')
url="http://www.simplici7y.com/items/ttep-7-marathon-1"
license=('unknown')
depends=('alephone-marathon')
source=(http://www.simplici7y.com/version/file/103/TTEP_${pkgver}__Marathon1_.zip)
md5sums=('945d24c67725749a6d571ca2705687cf')

build() {
  cd "TTEP $pkgver (Marathon1)/TTEP 7 (M1)"

  sed 's|M1 Textures|textures|g' -i "Textures M1"

  install -Dm644 "Textures M1" "$pkgdir"/usr/share/alephone/scenarios/marathon/Scripts/textures_marathon
  cp -rf "M1 Textures"/ "$pkgdir"/usr/share/alephone/scenarios/marathon/textures/

  find "$pkgdir" -type f -exec chmod 644 {} \;
}

# vim:set ts=2 sw=2 et:
