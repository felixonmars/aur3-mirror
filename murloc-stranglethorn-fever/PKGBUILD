pkgname=murloc-stranglethorn-fever
pkgver=2
pkgrel=1
pkgdesc='Warcraft murloc fan game spinoff (Flash game)'
arch=('any')
url='http://www.newgrounds.com/portal/view/574187'
license=("Newgrounds")
depends=('flashplayer-standalone')
source=("http://uploads.ungrounded.net/574000/574187__murlocrev_ng_final.swf"
"http://www.wowpedia.org/images/4/47/Murloc_Army_TCG_cropped.png"
"$pkgname.desktop"
"$pkgname.sh")
md5sums=('5d742834986f0753cd618ad67dd8d379'
         'd90ef822bd1e9c39184c49fe4cef19ff'
         '79bb8ce440e47cf3450c5a80507688cf'
         '4711c1e89d4d80ebc399008cc43f86f0')

package() {
  install -Dm644 "${srcdir}/574187__murlocrev_ng_final.swf" "${pkgdir}/usr/share/games/${pkgname}/574187__murlocrev_ng_final.swf"
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/Murloc_Army_TCG_cropped.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
}

