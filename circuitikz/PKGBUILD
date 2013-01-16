# Contributor: Jan Stępień <jstepien@users.sourceforge.net>
# Contributor: Robin Kreis <r.kreis@uni-bremen.de>

pkgname=circuitikz
pkgver=0.3.0
pkgrel=1
pkgdesc="A set of LaTeX macros designed to make it easy to draw electrical networks"
arch=("any")
license=('custom')
url="http://home.dei.polimi.it/mredaelli/circuitikz/"
depends=('texlive-core' 'texlive-latexextra' 'texlive-science')
source=("http://mirror.ctan.org/graphics/pgf/contrib/circuitikz.zip")
conflicts=('texlive-pictures')
sha1sums=('e9622611fb7c0cb198582630c88aadb0c58a6915')
install="circuitikz.install"

build() {
	mkdir -p $pkgdir/usr/share/texmf-dist/tex/latex
	cp -a circuitikz $pkgdir/usr/share/texmf-dist/tex/latex/ || return 1
	rm -f $pkgdir/usr/share/texmf-dist/tex/latex/circuitikz/*.pdf || return 1
	chmod 644 $pkgdir/usr/share/texmf-dist/tex/latex/circuitikz/* || return 1
}
