# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: Tom Vincent <http://tlvince.com/contact/>

pkgname=irssi-script-mouse
_name=mouse.pl
pkgver=1.0.0
pkgrel=1
pkgdesc="Mouse support for irssi"
arch=('any')
url="http://wouter.coekaerts.be/irssi/mouse"
license=('GPL 2')
depends=('irssi')
source=("http://wouter.coekaerts.be/irssi/scripts/mouse.pl")
sha256sums=('e31cc9f833bbbfa536e0f8656336ce3625d86395a7d13b858207439974a225ec')

prepare() {
	cd "$srcdir/"
	sed -i 's|xterm(-color)?\$|\^xterm|' $_name
}

package() {
	install -Dm644 "$srcdir/$_name" "$pkgdir/usr/share/irssi/scripts/$_name"
}
