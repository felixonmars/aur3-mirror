# Maintainer: aur@letopolis.de

pkgname=robustirc-birdge-git
_pkgname=robustirc-birdge
pkgver=20150314
pkgrel=1
pkgdesc="Bridge to robustirc.net-IRC-Network"
arch=(i686 x86_64)
url="http://robustirc.net/"
license=('BSD-3-clause')
depends=('go')


build() {

	GOPATH="$srcdir" go get github.com/robustirc/bridge/robustirc-bridge

}

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"

	mkdir -p "$pkgdir/usr/lib/systemd/system"
	install -p -m755 "$srcdir/src/github.com/robustirc/bridge/robustirc-bridge.service"* "$pkgdir/usr/lib/systemd/system"

	mkdir -p "$pkgdir/usr/lib/systemd/system"
	install -p -m755 "$srcdir/src/github.com/robustirc/bridge/robustirc-bridge.service"* "$pkgdir/usr/lib/systemd/system"

	mkdir -p "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 "$srcdir/src/github.com/robustirc/bridge/robustirc-bridge.service" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
