# Original autor: Nicolas Kielbasiewicz (nicolas.kielbasiewicz@ensta-paristech.fr)
# Maintainer: rabidaudio <charles@rabidaudio.com>
# Last edited: 18th September 2013

pkgname=texlive-tikz-uml
pkgver=1.0b
pkgrel=1
reldate=2013-02-01
license=('GPL')
depends=('texlive-core')
pkgdesc="A LaTeX package for drawing UML diagrams using pgf/tikz"
url="http://www.ensta-paristech.fr/~kielbasi/tikzuml/index.php?lang=en"
arch=('any')
install=texlive-tikz-uml.install
source=(http://www.ensta-paristech.fr/~kielbasi/tikzuml/src/tikzuml-v1.0b-2013-02-01.tbz)
md5sums=('79792be9bd27f895b5415bfc051a44a8')

package()
{
  mkdir -p "$pkgdir/usr/share/texmf-dist/tex/latex/tikz-uml"
  cp "$srcdir/tikzuml-v${pkgver}/tikz-uml.sty" "$pkgdir/usr/share/texmf-dist/tex/latex/tikz-uml/tikz-uml.sty"
}
