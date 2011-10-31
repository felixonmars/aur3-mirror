# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=otf-equinox
pkgver=1.0
pkgrel=3
pkgdesc="TTF equinox font by Matt Congreve"
arch=('any')
url="http://www.dafont.com/equinox.font"
license=("custom: Free for personal use")
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=${pkgname}.install

source=('http://img.dafont.com/dl/?f=equinox')

build() {
	cd "${srcdir}/"
	install -m755 -d "${pkgdir}/usr/share/fonts/OTF"
	install -m644 ./*.otf "${pkgdir}/usr/share/fonts/OTF/"
}

md5sums=('49434b7bbb6c11216b3b3b468cc7cdd3')
