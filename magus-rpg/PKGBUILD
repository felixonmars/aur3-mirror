pkgname=magus-rpg
pkgver=1
pkgrel=1
pkgdesc='Chrono Trigger fan game of Magus (Flash game)'
arch=('any')
url='http://www.newgrounds.com/portal/view/244675'
license=("Newgrounds")
depends=('flashplayer-standalone')
source=("http://uploads.ungrounded.net/244000/244675_Magus_RPG.swf"
"http://www.chronocompendium.com/Forums/avatars/Chrono%20Trigger/CTMagus2.png"
"$pkgname.desktop"
"$pkgname.sh")
md5sums=('c8e03ff3797a48ea8221fb63ce06054b'
         '032b3e9795d98dd5701269cd8786f23b'
         'e4c6d133a0048db88f0843007e58f07e'
         '57f48ec6baa447eda6350f877c8c7b47')

package() {
  install -Dm644 "${srcdir}/244675_Magus_RPG.swf" "${pkgdir}/usr/share/games/${pkgname}/244675_Magus_RPG.swf"
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/CTMagus2.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
}

