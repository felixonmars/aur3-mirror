# Maintainer: Federico Giuliani <federico.giuliani86 at gmail dot com>
# Dropbox version of gnome-shell-extension-pidgin-status
# Thanks to kdas for PKGBUILD idea and Mo Morsi for extension idea
# lerosua change it to fcitx, gome-shell-extension-fcitx-status <lerosua at gmail dot com>

pkgname=gnome-shell-extension-fcitx-status
pkgver=3.4
pkgrel=1
pkgdesc="A gnome shell extension that places the tray icon from Dropbox on the top bar rather than the hidden bottom bar"
url="http://geekr.google.com/files/gnome-shell-extension-fcitx-status-0.1.tar.gz"
depends=('gnome-shell')
source=('gnome-shell-extension-fcitx-status-0.1.tar.gz')
license=('GPL')
arch=('any')
build() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/fcitx.status@lerosua.org"
	cp extension.js $pkgdir/usr/share/gnome-shell/extensions/fcitx.status@lerosua.org
	cp metadata.json $pkgdir/usr/share/gnome-shell/extensions/fcitx.status@lerosua.org
}
md5sums=('623bee588f17375ae82a20c1d3954137')
