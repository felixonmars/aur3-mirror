pkgname=luvcview-git
pkgrel=1
pkgver=20070512
pkgdesc="Viewer for usb-uvc-cameras"
arch=('i686' 'x86_64')
url="https://github.com/NetworkOffice/luvcview"
license=('GPL')
makedepends=('git')
source=('git://github.com/NetworkOffice/luvcview')
md5sums=('SKIP')
build() {
	cd $srcdir/luvcview
	make
}
package() {
	cd "$srcdir/luvcview"
	mkdir -p "$pkgdir/usr/bin"
	make BIN="$pkgdir/usr/bin" install
}
