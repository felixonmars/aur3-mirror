pkgname=solidoak-git
pkgver=0.1.0.r0.gbeba4cd
pkgrel=2
pkgdesc="Simple IDE for Rust built on Neovim"
arch=('i686' 'x86_64')
url="https://github.com/oakes/SolidOak"
license="custom:Public Domain"
depends=()
optdepends=()
makedepends=('rust-nightly-bin' 'vte290')
provides=
conflict=
install=
source=("git://github.com/oakes/SolidOak.git")
# TODO: get sha sum
sha512sums=('SKIP')

_gitname=SolidOak

pkgver() {
	cd $srcdir/$_gitname
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd $srcdir/$_gitname
	cargo update
	cargo build
}

package() {
	cd $srcdir/$_gitname
	install -Dm755 "target/solidoak" "$pkgdir/usr/bin/solidoak"
	install -Dm644 "UNLICENSE" "$pkgdir/usr/share/licenses/$pkgname/UNLICENSE"
}
