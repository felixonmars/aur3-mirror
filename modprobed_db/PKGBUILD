# Maintainer: graysky <graysky AT archlinux dot us>
pkgname=modprobed_db
pkgver=2.21
pkgrel=2
pkgdesc='Keeps track of EVERY kernel module that has ever been probed. \
	Useful for those of us who make localmodconfig :)'
arch=('any')
license=('MIT')
depends=('kmod')
optdepends=('sudo')
url="https://wiki.archlinux.org/index.php/Modprobed_db"
source=("http://repo-ck.com/source/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('8c84ab384668a6eb177d962b878f008a48098dba51edea873c3b3775c2430da6')
install=readme.install

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
