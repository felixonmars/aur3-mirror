# Maintainer: Daniel Chesters (Oni)
# Contributor: Jeremy Newton (Mystro256)
#
# Emesene version of gnome-shell-extension-pidgin-status
# Thanks to kdas for PKGBUILD idea and Mo Morsi for extension idea

pkgname=gnome-shell-extension-emesene-status
pkgver=3.2
pkgrel=1
pkgdesc="A gnome shell extension that places the tray icon from Emesene on the top bar rather than the hidden bottom bar"
url="http://mo.morsi.org/blog/node/337"
depends=('emesene' 'gnome-shell')
source=('extension.js' 'metadata.json')
license=('GPL')
arch=('any')
build() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/emesene.status@gnome-shell.morsi.org"
	cp extension.js $pkgdir/usr/share/gnome-shell/extensions/emesene.status@gnome-shell.morsi.org
	cp metadata.json $pkgdir/usr/share/gnome-shell/extensions/emesene.status@gnome-shell.morsi.org
}
md5sums=('6646d5781efa1e0ca1a73cdcfc64cd6e'
         'e0b672a769152d397e0fd896fa70b626')
