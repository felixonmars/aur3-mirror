# Maintainer: Felipe Hommen <felibank at gmail dot com>
pkgname=texlive-multicolpar
pkgver=1.0
pkgrel=1
pkgdesc="Put successive paragraphs in different columns."
arch=('any')
url="http://www.ctan.org/"
license=('custom:"NOINFO"')
depends=('texlive-core')
#provides=()
#conflicts=()
install='texlive-multicolpar.install'

source=('http://mirror.ctan.org/macros/latex209/contrib/misc/multicolpar.sty' 'LICENSE')
md5sums=('f4d70c7772284f503de0e657bb6ab746' 'cfe963f5b828bd169d72872eccb0268e')

#build() {
#}

package() {
	mkdir -p $pkgdir/usr/share/texmf/tex/latex/multicolpar
	install -D -m644 $srcdir/multicolpar.sty $pkgdir/usr/share/texmf/tex/latex/multicolpar
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
