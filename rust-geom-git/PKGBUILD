# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=rust-geom-git
pkgver=r106.d694792
pkgrel=1
pkgdesc="Geometry primitives (basic linear algebra) for Rust"
arch=('i686' 'x86_64')
url="https://github.com/mozilla-servo/rust-geom"
license=('Apache' 'MIT')
depends=('rust')
makedepends=('git')
provides=('rust-geom')
source=("$pkgname"::'git://github.com/mozilla-servo/rust-geom.git')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	./configure
	make
}

package() {
	cd "$pkgname"
	install -d "$pkgdir/usr/lib/rustlib/$CARCH-unknown-linux-gnu/lib/"
	install -m 644 *.so "$pkgdir/usr/lib/rustlib/$CARCH-unknown-linux-gnu/lib/"
	install -m 644 *.rlib "$pkgdir/usr/lib/rustlib/$CARCH-unknown-linux-gnu/lib/"
	install -d "$pkgdir/usr/share/licenses/${pkgname}/"
	install -m 644 COPYRIGHT LICENSE-* "$pkgdir/usr/share/licenses/${pkgname}/"
}