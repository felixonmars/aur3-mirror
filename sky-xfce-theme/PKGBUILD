# Maintainer: Leonardo19

pkgname=sky-xfce-theme
pkgver=14.04
pkgrel=1
pkgdesc="Sky theme for xfce"
url="http://xfce-look.org/content/show.php/Sky?content=169072"
license=('GPL')
arch=('any')
makedepends=()
options=()
source=("http://www.comp.ydoma.info/sklad/Sky-${pkgver}.zip")

package() {
	mkdir -p ${pkgdir}/usr/share/themes/
	cp -r ${srcdir}/Sky $pkgdir/usr/share/themes
	chmod -R 755 $pkgdir/usr/share/themes/Sky
}

md5sums=('e3347d04c1b5b451163dee38a734e71b')
