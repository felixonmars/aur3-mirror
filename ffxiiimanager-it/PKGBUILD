# Maintainer: Red Squirrel <iam at redsquirrel dot tk>

pkgname=ffxiiimanager-it
pkgver=4.0
pkgrel=3
pkgdesc="FFXIII Manager - Italian translation for weapons and accessories"
arch=('any')
url="http://www.redsquirrel87.com/FFXIIIManager.html"
license=('freeware')
depends=('ffxiiimanager')
install=${pkgname}.install
source=(http://www.redsquirrel87.com/files/${pkgname}-AUR-${pkgver}.tar.gz)
md5sums=('f0a7a72a0a8942c461f2ccef5bec7839')

package() {
  install -b -Dm644 "${srcdir}/${pkgname}-${pkgver}/weaponsDB.csv" "${pkgdir}/usr/share/FFXIIIManager/weaponsDB-ITA.csv"
  install -b -Dm644 "${srcdir}/${pkgname}-${pkgver}/accessoriesDB.csv" "${pkgdir}/usr/share/FFXIIIManager/accessoriesDB-ITA.csv"
}

