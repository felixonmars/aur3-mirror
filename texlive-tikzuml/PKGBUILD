# Original autor: Nicolas Kielbasiewicz (nicolas.kielbasiewicz@ensta-paristech.fr)
# Maintainer: wwguo  <wwguocn@gmail.com>
# Last edited: 3th May 2012

pkgname=texlive-tikzuml
pkgver=0.9.8
pkgrel=1
license=('GPL')
depends=('texlive-core')
pkgdesc="A LaTeX package for drawing uml diagram using pgf/tikz"
url="http://www.ensta-paristech.fr/~kielbasi/tikzuml/index.php?lang=en"
arch=('any')
install=texlive-tikzuml.install
source=(http://www.ensta-paristech.fr/~kielbasi/tikzuml/src/tikzuml-v0.9.8-2012-04-24.tbz)
md5sums=('84fe8b04b43a73d1e37a779485c574e3')

build()
{
	mkdir -p $pkgdir/usr/share/texmf-dist/tex/latex/tikz-uml
	tar xjf $srcdir/tikzuml-v0.9.8-2012-04-24.tbz
	cp $srcdir/tikzuml-v0.9.8/tikz-uml.sty $pkgdir/usr/share/texmf-dist/tex/latex/tikz-uml/tikz-uml.sty
}
