# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=ttf-russo-one
pkgver=1.0
pkgrel=2
pkgdesc="Russo One by Jovanny Lemonad"
arch=('any')
url="http://jovanny.ru/"
license=("OFL1.1")
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install

source=('http://jovanny.ru/fonts/Russo.zip')

build() {
	cd "${srcdir}/"
	install -m755 -d "${pkgdir}/usr/share/fonts/TTF"
	install -m644 ./*.ttf "${pkgdir}/usr/share/fonts/TTF/"
}
md5sums=('fd7575cd37d2c25d728bf20b0bda5fdb')
