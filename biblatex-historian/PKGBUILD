# Maintainer: Mark van Dijk <mark@caffeine-powered.net>

pkgname=biblatex-historian
pkgver=0.4
pkgrel=1
pkgdesc="A citation- and bibliography style for the biblatex system which follows the guidelines of the Turabian Manual for Writers, which in turn is based on the Chicago Manual of Style."
url="http://tug.ctan.org/tex-archive/macros/latex/exptl/biblatex-contrib/biblatex-historian"
arch=('any')
license=('LPPL')
depends=('texlive-latexextra' 'texlive-bibtexextra')
install=biblatex-historian.install
source=($pkgname.zip::http://mirror.ctan.org/macros/latex/exptl/biblatex-contrib/$pkgname.zip)
md5sums=('a6b85f50a64fa418ac34fe66fd45bbf7')

build() {
  cd $srcdir/$pkgname
  install -d $pkgdir/usr/share/texmf/doc/latex/biblatex-contrib/biblatex-historian
  install -d $pkgdir/usr/share/texmf/tex/latex/biblatex-contrib/biblatex-historian

  install -Dm644 historian.lbx historian.bbx historian.cbx \
    $pkgdir/usr/share/texmf/tex/latex/biblatex-contrib/biblatex-historian

  install -Dm644 README.txt historian.pdf historian.bib \
    $pkgdir/usr/share/texmf/doc/latex/biblatex-contrib/biblatex-historian

  install -Dm644 README.txt $pkgdir/usr/share/licenses/$pkgname/README
}

