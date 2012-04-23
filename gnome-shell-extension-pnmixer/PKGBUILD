# Maintainer: Viktor Koptev <sbvitok@gmail.com>
pkgname=gnome-shell-extension-pnmixer
pkgver=3.2
pkgrel=1
pkgdesc="Integrates Pnmixer into the status bar."
arch=('any')
url="http://live.gnome.org/GnomeShell/Extensions"
license=('GPL' 'LGPL')
makedepends=('pnmixer' 'gnome-shell')
conflicts=()
source=("metadata.json"
		"extension.js")
md5sums=('68301b3fdb13d84c57d771998f321a73'
		 '072786812d54ffe0a1203b62c3c5d91f')

build() {
	cd "$srcdir"
}

package() {
	cd "$srcdir"
	install -d -m755 "${pkgdir}/usr/share/gnome-shell/extensions/pnmixer.status@gnome-shell.morsi.org"
	install -D -m644 metadata.json \
	"${pkgdir}/usr/share/gnome-shell/extensions/pnmixer.status@gnome-shell.morsi.org"
	install -D -m644 extension.js \
	"${pkgdir}/usr/share/gnome-shell/extensions/pnmixer.status@gnome-shell.morsi.org"
}
