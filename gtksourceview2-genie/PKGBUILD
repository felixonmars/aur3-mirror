# Maintainer: PirateJonno <jonno dot conder at gmail dot com>

pkgname=gtksourceview2-genie
pkgver=2.0
pkgrel=2
pkgdesc='Genie syntax highlighting for GtkSourceView-based editors'
arch=('any')
license=('GPL')
url='http://live.gnome.org/Genie'
depends=('gtksourceview2')
optdepends=('vala: to compile Genie code')
source=('genie.lang')
md5sums=('a23390c9312615e211b59bd8108de283')

build() {
	cd "$pkgdir"
	install -D -m644 "$srcdir/genie.lang" usr/share/gtksourceview-2.0/language-specs/genie.lang
}
