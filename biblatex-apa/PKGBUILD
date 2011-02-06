# Contributor: Mike Sager <mike@thegrateful.org>
pkgname=biblatex-apa
pkgver=0.9
pkgrel=1
pkgdesc="Biblatex citation and reference style for APA"
url="http://www.ctan.org/tex-archive/macros/latex/exptl/biblatex-contrib/biblatex-apa"
arch=('i686' 'x86_64')
license=('LPPL')
depends=('texlive-latexextra' 'biblatex')
install=biblatex-apa.install
source=(http://tug.ctan.org/get/macros/latex/exptl/biblatex-contrib/$pkgname.zip)
md5sums=('e55ed0ba3720e2e3fca8a64f29819051')

build() {
  cd $srcdir/$pkgname
  install -d $pkgdir/usr/share/texmf/doc/latex/biblatex-contrib/biblatex-apa
  install -d $pkgdir/usr/share/texmf/tex/latex/biblatex-contrib/biblatex-apa
  install -D -m644 apa.bbx apa.cbx american-apa.lbx french-apa.lbx german-apa.lbx ngerman-apa.lbx $pkgdir/usr/share/texmf/tex/latex/biblatex-contrib/biblatex-apa
  install -D -m644 README biblatex-apa-test-citations.bib biblatex-apa-test-references.bib biblatex-apa-test.pdf biblatex-apa-test.tex biblatex-apa.pdf biblatex-apa.tex $pkgdir/usr/share/texmf/doc/latex/biblatex-contrib/biblatex-apa
  install -D -m644 README $pkgdir/usr/share/licenses/$pkgname/README
}
