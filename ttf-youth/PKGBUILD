#PKGBUILDed by Byeongjin An <ahnkooon@gmail.com>
#This font has published by Korea Ministry of Female and Family and Korea Youth Work Agency. 
pkgname=ttf-youth
pkgver=1.0.0
pkgrel=1
pkgdesc="A neat hangul font, Choengsonyeon-che"
arch=('any')
url="https://www.kywa.or.kr/"
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
makdepends=('unzip')
source=('https://www.kywa.or.kr/about/Youth_ttf.zip')
md5sums=('725427d0282b656bd5031e0403249f00')

build() {
	cd $srcdir
	unzip Youth_ttf.zip
}

package() {
	cd $pkgdir
	install -d -m 755 usr/share/fonts/TTF || return 1
	install -m 644 ${srcdir}/*.ttf usr/share/fonts/TTF/ || return 1
}
