# Original author:  Nicolas Kielbasiewicz <nicolas.kielbasiewicz@ensta-paristech.fr>
# Packaged by: rabidaudio <charles@rabidaudio.com>
# Last edited: 18 Sep 2013

pkgname=texlive-tikz-uml
pkgver=1.0b
pkgrel=1
reldate=2013-02-01
license=('GPL')
depends=('texlive-core' 'texlive-pictures')
pkgdesc="A LaTeX package for drawing UML diagrams using pgf/tikz"
url="http://www.ensta-paristech.fr/~kielbasi/tikzuml/index.php"
arch=('any')
install=texlive-tikz-uml.install
source=(http://www.ensta-paristech.fr/~kielbasi/tikzuml/src/tikzuml-v1.0b-2013-02-01.tbz)
md5sums=('79792be9bd27f895b5415bfc051a44a8')

build()
{
  mkdir -p $pkgdir/usr/share/texmf/tex/latex/tikz-uml
  cp $srcdir/tikzuml-v${pkgver}/tikz-uml.sty $pkgdir/usr/share/texmf/tex/latex/tikz-uml
}
