pkgname=xelatex-stuff
pkgver=0.0
pkgrel=1
pkgdesc="Installs etoolbox and makecmds style files."
arch=('any')
url="http://example.com"
license=('custom:LPPL')
depends=('texlive-core')
install=(run-lsr.install)
source=('http://mirror.ctan.org/macros/latex/contrib/etoolbox/etoolbox.sty'
	'http://mirror.ctan.org/macros/latex/contrib/makecmds/makecmds.ins'
	'http://mirror.ctan.org/macros/latex/contrib/makecmds/makecmds.dtx')
md5sums=('02561c41bb08b479074b6e76f0b7d639'
	'a5c03e27360d783dbee14e722ac9cf8d'
	'8460991a4e542212ff7d88906879db7f')
sha256sums=('2193d6ca5211a387f7377050ad33cd470e19d427ebe9a39808252ef7d357134e'
	'19b82125d48e3eb0b6e7c93b4fb2be5f4eefb6c5c56d2d5df729bb6f1a0c2b5a'
	'e9041564fa521129f989829666c03ea4de36c15044e3a50337a9daee9b5eb47d')

build() {
	pdflatex makecmds.ins
}

package() {
  installdir="${pkgdir}/usr/local/share/texmf/tex/latex/"

	install -Dm755 etoolbox.sty "${installdir}/etoolbox/etoolbox.sty"
	install -Dm755 makecmds.sty "${installdir}/makecmds/makecmds.sty"
}

# vim:set ts=2 sw=2 et:

