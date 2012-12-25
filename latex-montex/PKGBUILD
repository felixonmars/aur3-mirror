pkgname=latex-montex
pkgver=04.09
pkgrel=1
pkgdesc="A Modern Mongolian implementation for the TeX and LaTeX2e."
arch=('any')
url="http://userpage.fu-berlin.de/corff/im/MLS/montex.html"
license=('GPL')
depends=('texlive-core')
source=('http://userpage.fu-berlin.de/corff/im/MLS/montex.tgz')
md5sums=('d057c32de7df81384e00531b23241d05')
install=latex-montex.install

package () {
	TEXMF="${pkgdir}/usr/share/texmf-dist/"

	mkdir -p "$TEXMF/tex/latex/montex/"
	mkdir -p "$TEXMF/fonts/source/public/mfinput/mls/"
	mkdir -p "$TEXMF/fonts/tfm/mls/"
	mkdir -p "$TEXMF/doc/montex/"

	cd "${srcdir}/montex"
	cp -dpr --no-preserve=ownership texinput/* "$TEXMF/tex/latex/montex/"
	cp -dpr --no-preserve=ownership mfinput/* "$TEXMF/fonts/source/public/mfinput/mls/"
	cp -dpr --no-preserve=ownership tfm/* "$TEXMF/fonts/tfm/mls/"
	cp -dpr --no-preserve=ownership doc/* "$TEXMF/doc/montex/"
}
