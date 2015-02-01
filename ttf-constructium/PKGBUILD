# Maintainer: lucy <lucy@luz.lu>

pkgname=ttf-constructium
_pkgname=constructium
pkgver=1.13.2.3
pkgrel=3
pkgdesc='A free font supporting constructed scripts such as Tengwar and Glaitha-B'
arch=('any')
url='http://www.kreativekorp.com/software/fonts/constructium.shtml'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
install="$pkgname.install"
source=('http://www.kreativekorp.com/swdownload/fonts/xlang/constructium.zip')
noextract=('constructium.zip')
sha256sums=('294d54f66640027dbe9508cee8637cce1c910fd8723e708b0aaad57337217623')
 
prepare() {
	cd "$srcdir"
	unzip -o constructium.zip Constructium.ttf OFL.txt
}

package() {
	cd "$srcdir"
	install -Dm644 Constructium.ttf "$pkgdir/usr/share/fonts/TTF/Constructium.ttf"
	install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
