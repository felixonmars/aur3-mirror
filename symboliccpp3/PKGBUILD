# Contributor: quasi <quasi@aur.archlinux.org>

pkgname=symboliccpp3
_pkgname=SymbolicC++3
pkgver=3.35
pkgrel=1
pkgdesc="SymbolicC++ uses C++ and object-oriented programming to develop a computer algebra system."
arch=('i686' 'x86_64')
url="http://issc.uj.ac.za/symbolic/symbolic.html"
license=(custom)
md5sums=('d5ed9e1784e3fd125c3f4b65611e9823' '0b9494533201e7202e2bf342a38162af')
source=(http://issc.uj.ac.za/symbolic/sources/SymbolicC++3-3.35-ac.tar.gz
		symbolicc.install)
install=symbolicc.install

build() {
	cd $srcdir/SymbolicC++3-${pkgver}
	./configure --prefix=/usr
	make 
	mkdir -p ${pkgdir}/usr/lib
	mkdir -p ${pkgdir}/usr/include

	cp .libs/libsymbolicc++.so.3.0.35 $pkgdir/usr/lib
	cp .libs/libsymbolicc++.a $pkgdir/usr/lib
	cp -a include/ ${pkgdir}/usr/
}
