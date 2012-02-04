# Contributor: Rudy Matela <rudy.matela@gmail.com>
pkgname=beamerthemediepen
pkgver="20070108"
pkgrel=1
pkgdesc="A beamer theme with a background image and a white transparent layer"
arch=('any')
url="http://www.guidodiepen.nl/2009/04/latex-beamer-diepen-style/"
license=('Custom')
depends=('texlive-core')
makedepends=()
install=$pkgname.install
source=("http://www.guidodiepen.nl/wp-content/uploads/2009/04/$pkgname-$pkgver.tar.gz")
md5sums=('153308b9615d993a0204b2cf57d73118')

build() {
	true
}

package() {
	cd "$startdir/src/$pkgname"
	install -Dm644 art/defaultBackground.jpg $pkgdir/usr/share/texmf-dist/tex/latex/beamer/art/defaultBackground.jpg
	install -Dm644 themes/color/beamercolorthemediepen.sty $pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/color/beamercolorthemediepen.sty
	install -Dm644 themes/font/beamerfontthemediepen.sty   $pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/font/beamerfontthemediepen.sty
	install -Dm644 themes/outer/beamerouterthemediepen.sty $pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/outer/beamerouterthemediepen.sty
	install -Dm644 themes/theme/beamerthemediepen.sty      $pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/theme/beamerthemediepen.sty
}
