# Maintainer: Michael Rapp <michael.rapp90@googlemail.com>

pkgname=gnome-shell-extension-hide-app-icon
pkgver=2.0
pkgrel=3
pkgdesc="Hides the icon and/or label of the currently focused application in the top panel of the GNOME shell."
arch=('any')
url="https://sourceforge.net/p/hide-app-icon"
license=('GPL')
source=("http://downloads.sourceforge.net/project/hide-app-icon/gnome-shell-extension-hide-app-icon-v$pkgver.zip")
md5sums=('51e54c6b19d8d6f4f97a7fd90f3a8a61')

package() {
	mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/"
	cp -Rf $srcdir/hide-app-icon@mrapp.sourceforge.com "${pkgdir}/usr/share/gnome-shell/extensions/"
	chmod -R +rx "${pkgdir}/usr/share/gnome-shell/extensions/hide-app-icon@mrapp.sourceforge.com"
}
