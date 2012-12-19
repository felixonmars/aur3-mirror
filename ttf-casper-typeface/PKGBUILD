# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=ttf-casper-typeface
pkgver=1.0
pkgrel=1
download="casper-${pkgver}-${pkgrel}.rar"
pkgdesc="TTF fort Casper Typeface by Michael Chereda"
arch=('any')
url="http://bit.ly/P6AG8D"
license=("OFL1.1")
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
noextract=("${download}")
source=("${download}::http://dl.dropbox.com/u/57042481/Casper%20Typface.rar")

build() {
	cd "${srcdir}/"
	unrar e ${download}
	install -m755 -d "${pkgdir}/usr/share/fonts/TTF"
	install -m644 ${srcdir}/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
	install -m755 -d "${pkgdir}/usr/share/licenses/$pkgname"
	install -m644 ${srcdir}/OFL.txt "${pkgdir}/usr/share/licenses/$pkgname"
}
md5sums=('46b63ebd4d980bfbfac3b70dfeb759c9')
