# Maintainer: Jente Hidskes <jthidskes@outlook.com>

pkgname=texlive-fitch
pkgver=1.6
pkgrel=1
pkgdesc="A LaTeX package for Fitch-style proofs, by Johan Klüwer"
arch=('any')
url="http://www.logicmatters.net/resources/fitch.sty"
license=('GPL')
depends=('tetex')
install=texlive-fitch.install
source=(http://www.logicmatters.net/resources/fitch.sty)
md5sums=('779ad7b711652ef973296f60b090a0d6')

package() {
	mkdir -p "${pkgdir}/usr/share/texmf-dist/tex/latex/fitch"
	install -Dm644 "${srcdir}/fitch.sty" "${pkgdir}/usr/share/texmf-dist/tex/latex/fitch/"
}
