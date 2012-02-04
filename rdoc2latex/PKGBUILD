# Contributor: Jan Stępień <jstepien@users.sourceforge.net>

pkgname=rdoc2latex
pkgver=0.1
pkgrel=1
pkgdesc="Generate LaTeX source code from text files formatted using the rdoc syntax."
arch=("any")
license=('MIT')
url="http://github.com/jstepien/rdoc2latex"
depends=('perl')
source=("http://github.com/jstepien/rdoc2latex/tarball/0.1")
sha1sums=('b0396a620b1f2560fbda1178197fb2811f3b9d11')

build() {
	mkdir -p $pkgdir/usr/bin
	install $srcdir/jstepien-rdoc2latex-*/rdoc2latex.pl \
		$pkgdir/usr/bin/rdoc2latex -m 755 || return 1
}
