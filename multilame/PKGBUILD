# Contributor: graysky <graysky AT archlinux dot us>
arch=('any')
license=('GPL2')
pkgname=multilame
pkgver=2.0
pkgrel=4
pkgdesc="Pseudo multi-threaded bash script to parallel encode .wav to .mp3 via lame."
depends=('lame')
url=http://aur.archlinux.org/packages.php?ID=35133
source=("https://github.com/graysky2/multilame/raw/master/$pkgname-source.tar.xz")
sha256sums=('6b26b3f31793d6bdb86ca00af20a1a286bda0396eedc35d6792da935f18d3cb5')
install=readme.install
backup=(etc/$pkgname.conf)

package() {
	cd "$srcdir/$pkgname-source"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 $pkgname.conf "$pkgdir/etc/$pkgname.conf"
}
