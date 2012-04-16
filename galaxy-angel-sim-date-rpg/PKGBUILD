pkgname=galaxy-angel-sim-date-rpg
pkgver=1
pkgrel=1
pkgdesc='Galaxy Angel fan-made sim dating RPG (Flash game, ADULT CONTENT WARNING!)'
arch=('any')
url='http://www.newgrounds.com/portal/view/203189'
license=("Newgrounds")
depends=('flashplayer-standalone')
source=("http://uploads.ungrounded.net/203000/203189_GASIM_main.swf"
"$pkgname.png"
"$pkgname.desktop"
"$pkgname.sh")
md5sums=('52233eb22c438995944cd6f79cf513fd'
         'eafb39a88c8c098a2257ea1a8ff44ca9'
         '9cef78d088246bf8f1ec39d8c41a5195'
         'fa19a1caab3f4425b61621c85d33329e')

package() {
  install -Dm644 "${srcdir}/203189_GASIM_main.swf" "${pkgdir}/usr/share/games/${pkgname}/203189_GASIM_main.swf"
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/$pkgname.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
}

