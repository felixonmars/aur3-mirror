# Maintainer: Michael Sproul <micsproul@gmail.com>
pkgname=gedit-rust
pkgver=20140704
pkgrel=1
pkgdesc='Rust syntax highlighting for Gedit.'
arch=(any)
url='https://github.com/rust-lang/rust/tree/master/src/etc/gedit'
license=('MIT')
makedepends=('git')
source=('https://raw.githubusercontent.com/rust-lang/rust/master/src/etc/gedit/share/gtksourceview-3.0/language-specs/rust.lang')
sha256sums=('SKIP')

package() {
	mkdir -p "${pkgdir}/usr/share/gtksourceview-3.0/language-specs"
	install -m 644 "${srcdir}/rust.lang" "${pkgdir}/usr/share/gtksourceview-3.0/language-specs/rust.lang"
}
