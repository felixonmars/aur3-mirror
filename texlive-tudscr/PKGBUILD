# Maintainer: Kevin Mäder <kmaeder[AT]kevin-maeder[dot]de>
# TU Dresden corporate design classes tudscr by Falk Hanisch

pkgname=texlive-tudscr
pkgver=1.0
pkgrel=2
pkgdesc="TeX Live - TU Dresden corporate design classes tudscr by Falk Hanisch"
license=('unknown')
arch=('any')
depends=('texlive-core' 'texlive-tud-cd-fonts')
url=("http://wwwpub.zih.tu-dresden.de/~fahan/tudscr/")
install=texlive.install
source=("http://wwwpub.zih.tu-dresden.de/~fahan/tudscr/download/download.php")
md5sums=('SKIP')

TEXPATH=/usr/share/texmf/

package() {
	cd $srcdir
	bsdtar -xf tudscr_v1.0.zip
	mkdir -p $pkgdir$TEXPATH
	cp -r doc $pkgdir$TEXPATH
	cp -r tex $pkgdir$TEXPATH
}
