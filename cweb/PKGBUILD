# Maintainer: Domenico Tortorella <dom.tortorella@gmail.com>
pkgname=cweb
pkgver=3.64
pkgrel=1
pkgdesc="The CWEB System of Structured Documentation"
arch=('i686' 'x86_64')
url="http://www-cs-faculty.stanford.edu/~uno/cweb.html"
license=('unknown')
depends=('texlive-core')
source=("ftp://ftp.cs.stanford.edu/pub/cweb/cweb.tar.gz")
md5sums=('8e488ec9932c117908c92d1c4614cdee')

build() {
	make cautiously
	make all
}

package() {
	install -D -m755 cweave $pkgdir/usr/local/bin/cweave
	install -D -m755 ctangle $pkgdir/usr/local/bin/ctangle
	install -D -m644 cwebmac.tex $pkgdir/usr/share/texmf/tex/generic/cwebmac.tex
	install -D -m644 c++lib.w $pkgdir/usr/local/lib/cweb/c++lib.w
	install -D -m644 cweb.1 $pkgdir/usr/share/man/man1/cweb.1
}
