# Maintainer: hauzer <alokinpwn at gmail dot com>
pkgname=gedit-euphoria
pkgver=16012009
pkgrel=1
pkgdesc="Euphoria syntax highlighting for gEdit."
arch=('any')
url="http://www.rapideuphoria.com/edi.htm"
license=('GPL2')
depends=('gedit')
source=("http://www.rapideuphoria.com/gedit_syntax.tar.bz2")
md5sums=('d62c546410a60eaa55a2ca77d83c707c')

package() {
  mkdir -p "${pkgdir}/usr/share/gtksourceview-2.0/language-specs"
  install -m644 "${srcdir}/gedit_syntax/euphoria.lang" "${pkgdir}/usr/share/gtksourceview-2.0/language-specs/"
  install -m644 "${srcdir}/gedit_syntax/gedit_syntax.xml" "${pkgdir}/usr/share/gtksourceview-2.0/language-specs/gedit_euphoria.xml"
}
