# Contributor: kaptoxic@yahoo.com
# Contributor: Mathew "deteego" de Detrich <deteego@gmail.com>

pkgname=gedit-scala
pkgver=1
pkgrel=3
pkgdesc="Scala Syntax Highlighting for gedit"
arch=('any')
url="https://github.com/scala/scala-tool-support/tree/master/tool-support/gedit"
license=('custom')
conflicts=('gtksourceview3')
source=(https://raw.githubusercontent.com/scala/scala-tool-support/master/tool-support/gedit/scala.lang)
md5sums=('92242e300d3ce05da00beebca45a756f')

package() {
	mkdir -p $pkgdir/usr/share/gtksourceview-3.0/language-specs
	cp $srcdir/* $pkgdir/usr/share/gtksourceview-3.0/language-specs
}
