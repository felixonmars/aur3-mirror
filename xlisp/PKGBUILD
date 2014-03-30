# Maintainer:  perlawk

pkgname=xlisp
pkgver=3.0
pkgrel=2 
pkgdesc="XLISP is a dialect of the Lisp programming language with extensions to support object-oriented programming."
url="http://www.xlisp.org"
arch=('x86_64' 'i686')
license=('GPL')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=( "http://www.xlisp.org/$pkgname.tar.gz" )
md5sums=('d11da6aeb612eb5666123a5203c4c059')

build() {
  cd "$pkgname"
	cp makefile.unix makefile
  make || return 1
}

package() {
  cd "$pkgname"
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/lib
	mkdir -p $pkgdir/usr/share/xlisp/doc
	mkdir -p $pkgdir/usr/share/xlisp/lib
	install -m755 bin/xlisp* $pkgdir/usr/bin
	install -m755 lib/lib* $pkgdir/usr/lib
	install -m755 *lsp $pkgdir/usr/share/xlisp/lib
	install -m755 *doc $pkgdir/usr/share/xlisp/doc
}
