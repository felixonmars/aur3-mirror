# Maintainer: Sietse van der Molen (sietse [@] vdmolen [.] eu)

pkgname=pgf-umlcd
pkgver=0.2.1
pkgrel=1
license=('GPL')
depends=('texlive-core')
pkgdesc="Some LaTeX macros for UML Class Diagrams"
url="https://code.google.com/p/pgf-umlcd/"
arch=('any')
install=pgf-umlcd.install
source=(https://pgf-umlcd.googlecode.com/files/pgf-umlcd-0.2.1.zip)
md5sums=('cfccada13633c0ee7d54fa9bf08abd2c')

package()
{
  mkdir -p $pkgdir/usr/share/texmf/tex/latex/pgf-umlcd
  cp $srcdir/pgf-umlcd-0.2.1/pgf-umlcd.sty $pkgdir/usr/share/texmf/tex/latex/pgf-umlcd
}
