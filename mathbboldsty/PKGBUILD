#
pkgname=mathbboldsty
pkgver=20091130
pkgrel=1
pkgdesc="The old LaTeX style file.In Texlive it is the mathbbol.sty."
arch=('any')
url="http://www.tux.org"
license=('GPL')
install=mathbbold.install
source=('mathbbold.sty')
md5sums=('2e131c6ea999d37cc2960acb903b4572')

build()
{
	cd $srcdir
	install -D -m 644 mathbbold.sty $pkgdir/usr/share/texmf-dist/tex/latex/jknapltx/mathbbold.sty
}
