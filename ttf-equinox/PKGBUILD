# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=ttf-equinox
pkgver=1.0
pkgrel=2
pkgdesc="Equinox font by Matt Congreve"
arch=('any')
url="http://www.dafont.com/equinox.font"
license=("custom: Free for personal use")
depends=('fontconfig')
install=${pkgname}.install

source=("equinox-${pkgver}-${pkgrel}.zip::http://img.dafont.com/dl/?f=equinox")

build() {
	cd "${srcdir}/"
	install -m755 -d "${pkgdir}/usr/share/fonts/OTF"
	install -m644 ./*.otf "${pkgdir}/usr/share/fonts/OTF/"
}

md5sums=('49434b7bbb6c11216b3b3b468cc7cdd3')
