# Maintainer: Florian Léger <florian6 dot leger at laposte dot net>

pkgname=sonny2
pkgver=2.2
pkgrel=3
pkgdesc='Combat based RPG where you play as a Zombie, level up and gain items to advance to the next Zone (Flash game).'
arch=('any')
url='http://armorgames.com/'
license=('custom')
makedepends=("imagemagick")
depends=('flashplayer-standalone')
_baseurl="http://armorgames.com/files/games"
_baseiconurl="http://armorgames.com/files/thumbnails"
_iconextension="jpg"
_game="sonny-2-2900"
source=("${_baseurl}/${_game}.swf"
        "${pkgname}.desktop"
        "${_baseiconurl}/${_game}.${_iconextension}"
        "${pkgname}.sh")
md5sums=('795fbd9da1ceb8ac748b9b227f2def3c'
         'c2bbf4d570340ed010042acf040a1dcf'
         '26edd8d91235e7b52e591c597177fd0d'
         'eb54e10baa0e4ab6faca69f82441f23d')

build() {
  # Convert icon format
  convert "${srcdir}/${_game}.${_iconextension}" "${srcdir}/${pkgname}.png"
}

package() {
  # Install the .swf file
  install -Dm644 "${srcdir}/${_game}.swf" "${pkgdir}/usr/share/games/${pkgname}/${pkgname}.swf"

  # Install launch script
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Install .desktop file
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install icon
  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
}

