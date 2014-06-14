# Contributor: Vojtech Kral <vojtech NȮSPÅM @kral.hk>

pkgname=kate-syntax-rust-git
pkgver=20140613
pkgrel=1
pkgdesc="Rust syntax highlighting for the KDE Katepart."
arch=(any)
url="https://github.com/mozilla/rust/blob/master/src/etc/kate/rust.xml"
license=('MIT')
makedepends=('git')
source=('https://github.com/mozilla/rust/raw/master/src/etc/kate/rust.xml')
sha256sums=('SKIP')


build() 
{
	true
}

pkgver() 
{
	date=$(curl -s https://api.github.com/repos/mozilla/rust/commits | sed -n 's/.*"date":.*"\(20.*\)"/\1/p' | head -n 1)
	date -d "$date" '+%Y%m%d'
}

package() 
{
	mkdir -p "$pkgdir/usr/share/apps/katepart/syntax/"
	install -m 644 "$srcdir/rust.xml" "$pkgdir/usr/share/apps/katepart/syntax/"
}

# vim:set ts=2 sw=2 et:
