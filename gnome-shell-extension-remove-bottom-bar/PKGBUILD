# Maintainer: alomsimoy [alomsimoy@gmail.com]

pkgname=gnome-shell-extension-remove-bottom-bar
pkgver=3.6
pkgrel=3
pkgdesc="Removes the Message tray (bottom bar). I recommend to use with gnome-shell-gnome2-notifications."
url="http://k2z.com"
depends=('gnome-shell')
source=('extension.js' 'metadata.json')
license=('GPL')
arch=('any')
build() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/remove_bottom_bar@k2z.com"
	cp extension.js $pkgdir/usr/share/gnome-shell/extensions/remove_bottom_bar@k2z.com
	cp metadata.json $pkgdir/usr/share/gnome-shell/extensions/remove_bottom_bar@k2z.com
}
md5sums=('7089c4106df5ad988c95f12c60862b13'
         'aadb6b4e1f72727f262d24db15899d74')
