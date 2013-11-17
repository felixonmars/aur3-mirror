# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=laternamagica
_pkgname=LaternaMagica
pkgver=0.4
pkgrel=1
pkgdesc="Image viewer and slideshow application for GNUstep"
arch=('i686' 'x86_64')
url="http://gap.nongnu.org/laternamagica/index.html"
license=('GPL')
depends=('gnustep-base' 'gnustep-gui')
makedepends=('gcc-objc' 'gendesk' 'imagemagick')
source=(http://savannah.nongnu.org/download/gap/$_pkgname-$pkgver.tar.gz)
md5sums=('73c25b76777a89589d1b5ad86936cdf5')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	convert Resources/laternamagica_64.tif $_pkgname.png
	gendesk -n -f --pkgname=$_pkgname --pkgdesc="Image viewer tool" --categories="Graphics;Viewer"
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	. /usr/share/GNUstep/Makefiles/GNUstep.sh
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 $_pkgname.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
	install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
