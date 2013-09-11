# Maintainer: HateJacket <thehatejacket at gmail dot com>
pkgname=ttf-reactor-sans
pkgver=1.0
pkgrel=1
pkgdesc="Reactor Sans by Isaac González, from DaFont.com."
arch=('any')
url="http://www.dafont.com/reactor-sans.font"
license=('Free')
depends=('fontconfig' 'xorg-font-utils')
install=ttf-reactor-sans.install
source=('http://img.dafont.com/dl/?f=reactor_sans')
noextract=('?f=reactor_sans')
md5sums=('3a02941b893326624c74be97a9465428')

prepare() {
	cd "$srcdir"
	mv "?f=reactor_sans" "reactor_sans.zip"
	unzip reactor_sans.zip
}

package() {
	install -Dm0644 $srcdir/Reactor-Sans.ttf $pkgdir/usr/share/fonts/TTF/Reactor-Sans.ttf
}
