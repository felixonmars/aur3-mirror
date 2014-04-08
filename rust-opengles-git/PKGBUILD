# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=rust-opengles-git
pkgver=r183.8a617c2
pkgrel=1
pkgdesc="OpenGL ES 2.0 bindings for Rust"
arch=('i686' 'x86_64')
url="https://github.com/mozilla-servo/rust-opengles"
license=('Apache' 'MIT')
depends=('mesa' 'rust')
makedepends=('git')
provides=('rust-opengles')
source=("$pkgname"::'git://github.com/mozilla-servo/rust-opengles.git')
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
	install -m 644 COPYING LICENSE-* "$pkgdir/usr/share/licenses/${pkgname}/"
}