# Maintainer: perlawk

pkgname=slisp
pkgver=2.2
pkgrel=1
pkgdesc="SLisp is a simple Lisp interpreter that implements most of the common Lisp constructs.  It may be useful for learning the basis of the Lisp language."
arch=('i686' 'x86_64')
url="http://www.sigala.it/sandro/software.php#slisp"
license=("GPL")
depends=("readline" "gmp" "ncurses")
source=(
"http://jaist.dl.sourceforge.net/project/slisp/slisp/slisp2.2/slisp-2.2.tar.bz2")

build() {
  cd "$srcdir"/$pkgname-$pkgver
	./configure --with-readline=/usr/include/readline --without-yacas --with-gmp=/usr/include
  make 
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
	mkdir -p "$pkgdir"/usr/bin
	mkdir -p "$pkgdir"/usr/share/man/man1
	mkdir -p "$pkgdir"/usr/lib
	cp src/slisp "$pkgdir"/usr/bin
	cp src/slisp.1 "$pkgdir"/usr/share/man/man1
	cp lib/libslisp.a "$pkgdir"/usr/lib
}
md5sums=('0ac88f8883a93745dbaec32ea8817c34')
