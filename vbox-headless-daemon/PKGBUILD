# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='vbox-headless-daemon'
_pkgname_short='vbhd'
pkgver=1.4
pkgrel=2
pkgdesc='Control a Virtualbox VM running as a headless daemon'
arch=('any')
url="https://github.com/graysky2/$pkgname"
license=('GPL3')
depends=('virtualbox')
source=("http://repo-ck.com/source/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('10171084122527f00e99bb7c6a18915bb9609049771ae25f2e7ae421db5a7b1b')

package() {
	cd "$pkgname-$pkgver"
	
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
	ln -s "/usr/bin/$pkgname" "$pkgdir/usr/bin/$_pkgname_short"
	install -Dm644 $_pkgname_short.skel "$pkgdir/usr/share/$_pkgname_short/$_pkgname_short.skel"
}
