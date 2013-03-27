# Contributor: Rémy EVEN <evenremy@gmail.com>
pkgname=littre
pkgver=2.0
pkgrel=2
pkgdesc="The great french dictionary of Émile Littré (Qt)"
arch=('any')
url="http://code.google.com/p/dictionnaire-le-littre/"
license=('custom:"CeCILL"')
depends=('qt4')
source=(http://dictionnaire-le-littre.googlecode.com/files/Littre-source-${pkgver}.tar.bz2 \
 	main.cpp.${pkgver}.diff \
 	littre.desktop)
md5sums=('c71666ae4cf6353d2bbb7e98dcca9159'
         'd2c1baf1e14deef8b22898074c8c12f4'
         '8d5d8a0d397eb446b47b413da331f7b7')

#########################
# Evolutions possibles : 
#	- supprimer le patch
#	- It is recommended to keep files in $pkgname/, instead
#	of deep nesting.  AUR guidelines suggest to not include binaries.  You
#	have accidentally tarred up some dotfiles.  Examples:
#	littre/.hg/store/data/main.cpp.2.0.diff.i
#	littre/.hg/store/data/main.cpp.1.0.diff.i
#	.hgtags
#	littre/.hg/store/data/littre.desktop.i
#	... and more.  Suggestion: use "makepkg --source".
#########################
# Commentaires :
# orivej wrote:
#
#I patched littre to look better: disabled custom theme, made layouts
#of all the windows adjustable, reset icon sizes from 32x32 to the
#default 16x16, reset font sizes etc.  I also prevented littre from
#hiding when the window loses focus.  Does anybody need this patch?
##########################

build() {
  cd "$srcdir/Littre-source-2.0"
  patch -f src/main.cpp ../main.cpp.${pkgver}.diff || return 1
  qmake-qt4 || return 1
  make || return 1
  install -D -m 644 Licence-CeCILL.txt ${startdir}/pkg/usr/share/licenses/${pkgname}/LICENCE
  install -D -m 644 ../${pkgname}.desktop ${startdir}/pkg/usr/share/applications/${pkgname}.desktop
  install -D -m 644 "ui/Girls I do adore....png" ${pkgdir}/usr/share/pixmaps/${pkgname}.png
  install -D -m 755 bin/Littre ${pkgdir}/usr/bin/littre || return 1
  install -D -d bin ${pkgdir}/usr/share/${pkgname} || return 1
  install -D -m 644 bin/*.* ${pkgdir}/usr/share/${pkgname} || return 1
}

