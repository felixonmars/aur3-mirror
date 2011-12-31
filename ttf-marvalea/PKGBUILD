# Maintainer: nexus7 <minsukim at gmx dot net>

pkgname=ttf-marvalea
pkgver=1.0
pkgrel=1
pkgdesc="Truetype font with dice game symbols by Martin Vogel."
arch=('any')
url="http://www.marvosym.de/marvalea.html"
license=("CC BY-NC-SA 2.5")
depends=('fontconfig' 'xorg-font-utils')
install=${pkgname}.install
source=('http://www.marvosym.de/MarVAlea.ttf')
md5sums=('60565c469a3fd3786f3af4f2411527b1')

build() {
	cd "${srcdir}/"
	install -m755 -d "${pkgdir}/usr/share/fonts/TTF"
	install -m644 ./*.ttf "${pkgdir}/usr/share/fonts/TTF/"
}
