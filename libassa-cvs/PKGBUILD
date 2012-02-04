# Maintainer:  Devin Cofer <ranguvar{AT]archlinux[DOT}us>
# Contributor: Vamp898 <vamp898@web.de>

pkgname=libassa-cvs
_pkgname=libassa
pkgver=20090822
pkgrel=1
pkgdesc="Object-oriented C++ networking library based on Adaptive Communication Patterns (Dev tree)"
arch=('i686' 'x86_64')
url="http://libassa.sourceforge.net/"
license=('LGPL')

makedepends=('cvs')
provides=('libassa')
conflicts=('libassa')

source=()
sha256sums=()
install="$pkgname.install"

_cvsroot=":pserver:anonymous:@libassa.cvs.sourceforge.net:/cvsroot/libassa"
_cvsmod="$_pkgname"


build() {
	cd "$srcdir"
	msg "Performing source checkout..."
	if [ -d "$_cvsmod/CVS" ]; then
		cd "$_cvsmod"
		cvs -z3 -update -d || return 1
		cd ..
	else
		cvs -z3 -d "$_cvsroot" co -D "$pkgver" -f "$_cvsmod" || return 1
	fi
	msg "Source checkout finished."
	rm -rf "$_cvsmod-build"
	cp -r "$_cvsmod" "$_cvsmod-build" || return 1
	cd "$_cvsmod-build"

	./bootstrap || return 1
	./configure --prefix=/usr || return 1
	make || return 1
}
package() {
	cd "$_cvsmod-build"

	make DESTDIR="$pkgdir" install || return 1
}
