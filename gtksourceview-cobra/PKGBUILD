# Maintainer: JHeaton <jheaton at archlinux dot us>

pkgname=gtksourceview-cobra
pkgver=5
pkgrel=1
pkgdesc="Cobra syntax highlighting for gtksourceview2 editors"
arch=('any')
url="http://cobra-language.com/trac/cobra/wiki/GtkEditors"
license=('Unknown')
depends=('gtksourceview2')
source=(cobra.lang::http://cobra-language.com/trac/cobra/raw-attachment/wiki/GtkEditors/cobra.5.lang)
noextract=()
md5sums=('3cde2425c1dada9dfff2fd20b126c0ae')

build() {
  install -Dm644 ${srcdir}/cobra.lang ${pkgdir}/usr/share/gtksourceview-2.0/language-specs/cobra.lang
}
