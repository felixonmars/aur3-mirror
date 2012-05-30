# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=ttf-aerolite
pkgver=1.0
pkgrel=4
pkgdesc="Aerolite font by Jan Paul"
arch=('any')
url="http://www.dafont.com/aerolite.font"
license=("custom: Free for personal use")
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=${pkgname}.install

source=("aerolite-${pkgver}-${pkgrel}.zip::http://img.dafont.com/dl/?f=aerolite")

build() {
	cd "${srcdir}/"
	install -m755 -d "${pkgdir}/usr/share/fonts/TTF"
	install -m644 ./*.ttf "${pkgdir}/usr/share/fonts/TTF/"
	install -D -m644 "Aerolite - Read Me.html" "${pkgdir}/usr/share/licenses/${pkgname}/About.html"
}

md5sums=('e7642871cb4f702e270a95187b6d09a2')
