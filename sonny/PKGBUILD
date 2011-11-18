# Maintainer: Florian Léger <florian6 dot leger at laposte dot net>

pkgname=sonny
pkgver=4.1
pkgrel=3
pkgdesc='Fight for your zombie life in this crazy and twisted world (Flash game).'
arch=('any')
url='http://armorgames.com/'
license=('custom')
makedepends=("imagemagick")
depends=('flashplayer-standalone')
_baseurl="http://armorgames.com/files/games"
_baseiconurl="http://armorgames.com/files/thumbnails"
_iconextension="gif"
_game="${pkgname}-505"
source=("${_baseurl}/${_game}.swf"
        "${pkgname}.desktop"
        "${_baseiconurl}/${_game}.${_iconextension}"
        "${pkgname}.sh")
md5sums=('f66db6cc83faf3f4e4a027b58a53dab3'
         '7deb1cfba9593ee99b0593ab9c74f8ca'
         'ff8fae47aa1acf815de6415169daef23'
         'b18a7c709399ab1184a3b7402911d2a1')

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


