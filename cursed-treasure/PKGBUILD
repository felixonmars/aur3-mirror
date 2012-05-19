# Maintainer: Florian Léger <florian6 dot leger at laposte dot net>

pkgname=cursed-treasure
pkgver=1.10.0073
pkgrel=1
pkgdesc='A neat Tower Defense game with new twists (Flash game).'
arch=('any')
url='http://www.iriysoft.ru/projects/flash/cursed-treasure'
license=('custom')
depends=('flashplayer-standalone')
_baseurl="http://iriysoft.ru/CT"
_swf="CursedTreasure.swf"
source=("${_baseurl}/${_swf}"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}.sh")
md5sums=('641bc46b03822e1f15f2546dcd6c9402'
         '42e68388a482b0723096d076d3d39c40'
         '800d9ce68c863241ce4672dfcd2bdfbe'
         '9fff7556594f367047e8ec89cd3f1c4e')

package() {
  # Install the .swf file
  install -Dm644 "${srcdir}/${_swf}" "${pkgdir}/usr/share/games/${pkgname}/${_swf}"

  # Install launch script
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Install .desktop file
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install icon
  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
}

