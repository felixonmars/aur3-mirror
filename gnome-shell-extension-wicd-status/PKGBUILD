# Maintainer: gfreezy[at]gmail.com

pkgname=gnome-shell-extension-wicd-status
pkgver=0.1
pkgrel=2
url="http://blog.norida.me/blog/2011/12/05/move-wicds-icon-to-gnome-shells-status-bar-top-bar/"
pkgdesc="Extension to move the Wicd icon from the notification area (bottom bar) to the status area (top bar)."
depends=('wicd' 'wicd-gtk' 'gnome-shell')
source=('extension.js' 'metadata.json')
license=('GPL')
arch=('any')
build() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/wicd.status@gnome-shell.gnome.org"
	cp extension.js $pkgdir/usr/share/gnome-shell/extensions/wicd.status@gnome-shell.gnome.org
	cp metadata.json $pkgdir/usr/share/gnome-shell/extensions/wicd.status@gnome-shell.gnome.org
}
md5sums=('1e441b7c4217a3c6626eb673766f74b2'
         '994e6e5646cff885442b17ca56cb24c6')
