# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=ttf-neometric
pkgver=1.0
pkgrel=4
pkgdesc="Neometric font by Andres Sanchez"
arch=('any')
url="http://www.andresls.com/"
license=("custom: Free for personal use")
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=${pkgname}.install

source=("neometric-${pkgver}-${pkgrel}.zip::http://img.dafont.com/dl/?f=neometric")

build() {
	cd "${srcdir}/"
	install -m755 -d "${pkgdir}/usr/share/fonts/OTF"
	install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 ./*.otf "${pkgdir}/usr/share/fonts/OTF/"
	install -m644 ./*.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}

md5sums=('6cfca278b1354e78f380aa7cda50c843')
