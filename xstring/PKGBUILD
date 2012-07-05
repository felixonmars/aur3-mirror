# Contributor: Jan Stępień <jstepien@users.sourceforge.net>
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=xstring
pkgver="1.5d"
pkgrel=2
pkgdesc="This package provides macros manipulating strings for programming use"
arch=("any")
license=('LPPL')
url="http://tug.ctan.org/tex-archive/macros/latex/contrib/xstring/"
depends=('tetex')
source=("http://mirror.ctan.org/macros/latex/contrib/xstring.zip")
sha1sums=('70e4c33989b444228e56901625a69f5760d510a8')
install="xstring.install"

build() {
	mkdir -p $pkgdir/usr/share/texmf-dist/tex/latex/xstring
	install xstring/xstring.{sty,tex} -m 644 \
		$pkgdir/usr/share/texmf-dist/tex/latex/xstring
}
