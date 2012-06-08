# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=ttf-shojumaru
pkgver=1.001
pkgrel=1
pkgdesc="Shojumaru font by Brian J. Bonislawsky"
arch=('any')
url="http://www.ffonts.net/Shojumaru.font"
license=("OFL1.1")
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install

source=('http://www.ffonts.net/Shojumaru.font.zip')

build() {
	cd "${srcdir}/"
	install -m755 -d "${pkgdir}/usr/share/fonts/TTF"
	install -m644 ./*.ttf "${pkgdir}/usr/share/fonts/TTF/"
}
md5sums=('8de915aa042f5eddd2ed5a90abad1479')
