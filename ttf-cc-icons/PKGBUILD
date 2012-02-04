# Contributor: kwurzel <julius.bullinger at gmail dot com>

pkgname=ttf-cc-icons
pkgver=1
pkgrel=1
pkgdesc="Creative Commons logo and icons in an embeddable TTF."
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
arch=('i686' 'x86_64')
license=('CCPL:by')
source=("http://mirrors.creativecommons.org/presskit/cc-icons.ttf")
url="http://creativecommons.org/about/downloads"
install="ttf.install"

md5sums=('84873ab8ad1430882b73348ba2d01f09')

build() {
	install -d ${startdir}/pkg/usr/share/fonts/TTF/
	install -D -m644 cc-icons.ttf ${startdir}/pkg/usr/share/fonts/TTF/cc-icons.ttf
}
