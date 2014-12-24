# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Author: horst3180 @ deviantart

pkgname="ceti-3.14-theme"
_pkgname="Ceti-3.14-theme"
pkgver="20141018"
pkgrel="3"
pkgdesc="Ceti-3.14 is the official continuation of Ceti for Gnome 3.14"
arch=('any')
url='http://horst3180.deviantart.com/art/Ceti-3-14-theme-489193140'
license=('GPL3')
depends=('gtk-engine-murrine')
provides=("${pkgname}")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/horst3180/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('5e3fa37a9fcbe1580d641ec6117c51d3')

package() {
	cd "${_pkgname}-${pkgver}"
	find "Ceti-3.14" -type f -not -name *~ -exec install -Dm644 '{}' "${pkgdir}/usr/share/themes/{}" \;
	cp -dr --no-preserve='ownership' LICENSE "${pkgdir}/usr/share/themes/Ceti-3.14/"

	cd "Chrome"
	mkdir -p "${pkgdir}/usr/share/themes/Ceti-3.14/Chrome/" 
	cp -dr --no-preserve='ownership' "Ceti-3.14-chrome.crx" "${pkgdir}/usr/share/themes/Ceti-3.14/Chrome/"
}
