# Maintainer : Luca Bennati <lucak3 AT gmail DOT com>

pkgname=giftedmotion
pkgver=1.23
pkgrel=1
pkgdesc="Java based GIF maker"
arch=('any')
url="http://www.onyxbits.de/giftedmotion"
license=('GPL2')
depends=('java-environment' 'hicolor-icon-theme')
install=giftedmotion.install
source=("http://www.onyxbits.de/sites/default/files/upload_cck/node/525/${pkgname}-${pkgver}.jar"
		giftedmotion
		giftedmotion.desktop)
noextract=("${pkgname}-${pkgver}.jar")
md5sums=('bfdf2f92794fc2b34f4455663143b9b2'
         'cd3dfdf1e493228521aa67e737ca67af'
         'ac8c60825a412f25ed579af5f25993aa')

build() {
  bsdtar -xf "${pkgname}-${pkgver}.jar"
}

package() {
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  install -DTm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -DTm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  for dim in "32x32" "48x48" "64x64" "96x96"; do
    install -DTm644 "${srcdir}/resources/logo-${dim}.png" "${pkgdir}/usr/share/icons/hicolor/${dim}/${pkgname}.png"
  done
  install -DTm644 "${srcdir}/resources/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}

# vim:set ts=2 sw=2 et:
