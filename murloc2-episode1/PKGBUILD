pkgname=murloc2-episode1
pkgver=1
pkgrel=1
pkgdesc='Sequel to Murloc (Flash game)'
arch=('any')
url='http://www.newgrounds.com/portal/view/579313'
license=("Newgrounds")
depends=('flashplayer-standalone')
source=("http://uploads.ungrounded.net/579000/579313_MurlocRPG2_E1_NG_Final.swf"
"http://www.wowpedia.org/images/9/90/Murloc.png"
"$pkgname.desktop"
"$pkgname.sh")
md5sums=('de2edcc2354e4835eb4f398643d9be50'
         '961e74ef9ad9e9e83c98bda5f9eb14a5'
         '4a9532358758df3a4e7774d5fe1e5563'
         '863264d48e671c12cfa24f244b385d8a')

package() {
  install -Dm644 "${srcdir}/579313_MurlocRPG2_E1_NG_Final.swf" "${pkgdir}/usr/share/games/${pkgname}/579313_MurlocRPG2_E1_NG_Final.swf"
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/Murloc.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
}

