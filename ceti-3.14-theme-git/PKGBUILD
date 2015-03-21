# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Author: horst3180 @ deviantart

_pkgbase="ceti-3.14-theme"
_pkgname="Ceti-3.14-theme"
pkgname="${_pkgbase}-git"
pkgver=87d0a3b
pkgrel=1
pkgdesc="Ceti-3.14 is the official continuation of Ceti for Gnome 3.14"
arch=('any')
url="http://horst3180.deviantart.com/art/Ceti-3-14-theme-489193140"
license=('GPL3')
depends=('gnome-themes-standard' 'gtk-engine-murrine')
makedepends=('git')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
install="${pkgname}.install"
source=("git://github.com/horst3180/Ceti-3.14-theme")
md5sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --always | sed 's|-|.|g' | sed 's|_|.|g' | cut -d'.' -f2-
}


package() {
	cd "${_pkgname}"
	find "Ceti-3.14" -type f -not -name *~ -exec install -Dm644 '{}' "${pkgdir}/usr/share/themes/{}" \;
	cp -dr --no-preserve='ownership' LICENSE "${pkgdir}/usr/share/themes/Ceti-3.14/"

	cd "Chrome"
	mkdir -p "${pkgdir}/usr/share/themes/Ceti-3.14/Chrome/" 
	cp -dr --no-preserve='ownership' "Ceti-3.14-chrome.crx" "${pkgdir}/usr/share/themes/Ceti-3.14/Chrome/"
}
