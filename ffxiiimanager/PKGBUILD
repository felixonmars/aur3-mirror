# Maintainer: Red Squirrel <iam at redsquirrel dot tk>

pkgname=ffxiiimanager
pkgver=4.0
pkgrel=2
pkgdesc="A simple Linux tool to get all info about Final Fantasy XIII weapons and accessories, such as rank, catalyst, shops, prices, remaining experience to star level."
arch=('any')
url="http://www.redsquirrel87.com/FFXIIIManager.html"
license=('freeware')
depends=('gambas2-gb-gtk' 'gambas2-gb-form')
optdepends=('gambas2-gb-qt: if you need the QT support (KDE)'
'ffxiimanager-ita: Italian translation for weapons and accessories.')
install='ffxiiimanager.install'
source=(http://www.redsquirrel87.com/files/${pkgname}-AUR-${pkgver}.tar.gz)
md5sums=('7bd4919604b4f887c385a7d416455f24')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/FFXIII.gambas" "${pkgdir}/usr/share/FFXIIIManager/FFXIII.gambas"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/weaponsDB.csv" "${pkgdir}/usr/share/FFXIIIManager/weaponsDB.csv"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/accessoriesDB.csv" "${pkgdir}/usr/share/FFXIIIManager/accessoriesDB.csv"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/ffxiiimanager.desktop" "${pkgdir}/usr/share/applications/ffxiiimanager.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/ffxiiimanager128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/ffxiiimanager.png"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/ffxiiimanager64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/ffxiiimanager.png"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/ffxiiimanager32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/ffxiiimanager.png"
}

