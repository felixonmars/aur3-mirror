# Maintainer: perlawk
pkgname=jimtcl
pkgver=0.75
pkgrel=1
pkgdesc="Jim is an opensource small-footprint implementation of the Tcl programming language."
url="http://jim.tcl.tk/index.html/doc/www/www/index.html"
arch=('x86_64' 'i686')
license=('freebsd')
depends=()
optdepends=()
makedepends=('git')
conflicts=()
sources=()
 
build() {
  cd "${srcdir}/"
	if [ ! -e jimtcl ]; then
		git clone git://repo.or.cz/jimtcl.git
	fi
	cd jimtcl
	./configure --prefix=/usr
  make -j4
}
 
package() {
  cd "${srcdir}/jimtcl"
  make DESTDIR="${pkgdir}" install
	mkdir -p "$pkgdir/usr/share"
	mv "$pkgdir/usr/doc" "$pkgdir/usr/share/"
}
