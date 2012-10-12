# Maintainer: Joan Rieu <toto_pirate@hotmail.fr>
pkgname=mcpixel
pkgver='1.8'
pkgrel=1
pkgdesc="McPixel is a save-the-day guy that you guide through short challenges in an oldschool point'n'click fashion."
arch=any
url='http://mcpixel.net/'
license=('custom: "commercial"')
depends=('adobe-air')
source=("${pkgname}.sh")
md5sums=('5524c88b97ded0dd0a9874834aa87f3f')
_gamepkg="${pkgname}-v18.air"

build() {
  cd "${srcdir}"
  warning "You need to buy the full game to install this package."
  if [[ ! -f "${_gamepkg}" ]]; then
    error "The 'AIR file' download '${_gamepkg}' has to be placed in '$(pwd)'."
    return 1
  fi
}

package() {
  cd "$srcdir"
  install -Dm644 "${_gamepkg}" "${pkgdir}/opt/${pkgname}.air"
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
