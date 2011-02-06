# Maintainer: PirateJonno <jonno dot conder at gmail dot com>

pkgname=gtksourceview2-gas
pkgver=2.0
pkgrel=2
pkgdesc='GNU Assembler syntax highlighting for GtkSourceView-based editors'
arch=('any')
license=('GPL')
url='http://www.gnu.org/software/binutils/'
depends=('gtksourceview2')
optdepends=('binutils: to use the GNU Assembler')
source=('gas.lang')
md5sums=('03da14b200bf9c11abe2893c8d18a22a')

build() {
	cd "$pkgdir"
	install -D -m644 "$srcdir/gas.lang" usr/share/gtksourceview-2.0/language-specs/gas.lang
}
