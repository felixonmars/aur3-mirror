# Maintainer: HateJacket <thehatejacket at gmail dot com>
pkgname=ttf-openlogos
pkgver=1.0
pkgrel=1
pkgdesc="Font depicting various open-source logos, by CtrlAltF12"
arch=('any')
url="http://www.dafont.com/openlogos.font"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf-openlogos.install
source=('http://img.dafont.com/dl/?f=openlogos')
noextract=('?f=openlogos')
md5sums=('018796ecda06d556f0cb9ed8c4642ea3')

prepare() {
	cd "$srcdir"
	mv "?f=openlogos" "openlogos.zip"
	unzip openlogos.zip
}

package() {
	cd "$srcdir"
	install -Dm0644 openlogos.ttf $pkgdir/usr/share/fonts/TTF/openlogos.ttf
}
