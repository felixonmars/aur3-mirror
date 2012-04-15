pkgname=the-room-rpg
pkgver=3.1
pkgrel=1
pkgdesc='The popular The Room RPG from Newgrounds (Flash game)'
arch=('any')
url='http://www.newgrounds.com/portal/view/547307'
license=("Newgrounds")
depends=('flashplayer-standalone')
source=("http://uploads.ungrounded.net/547000/547307_theroom31.swf"
"$pkgname.png"
"$pkgname.desktop"
"$pkgname.sh")
md5sums=('c056d1a23f5dff3d2680dd84e5bd721f'
         'ba1aa034fa213b239f10920a18effc0b'
         '71c574a2d0c9b7329e41986eb550de36'
         'e3d49139778d3d7d6575573796e3081a')

package() {
  install -Dm644 "${srcdir}/547307_theroom31.swf" "${pkgdir}/usr/share/games/${pkgname}/547307_theroom31.swf"
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/$pkgname.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
}

