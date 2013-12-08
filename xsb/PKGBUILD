# Maintainer: perlawk

pkgname=xsb
_pkgname=XSB
pkgver=3.40
_pkgver=340
pkgrel=1
pkgdesc="XSB is a Logic Programming and Deductive Database system for Unix and Windows."
arch=('i686' 'x86_64')
url="http://xsb.sourceforge.net/"
license=('LGPL' 'GPL')
install=xsb.install
options=(!strip)
source=( "http://optimate.dl.sourceforge.net/project/xsb/xsb/3.4%20%28Soy%20mILK%29/${_pkgname}${_pkgver}.tar.gz")
#XSB340.tar.gz

build() {
  cd "$srcdir"/${_pkgname}/build
	SHARED_XSB=${srcdir}/usr/share/xsb
	mkdir -p ${SHARED_XSB}
  ./configure  --prefix=${SHARED_XSB} 
	./makexsb
	./makexsb install
}

package() {
  cd "$srcdir"/
	SHARED_XSB=${srcdir}/usr/share/xsb
	cp -a usr ${pkgdir}/
	mkdir -p "$pkgdir"/usr/share/man/man1
	cp ${_pkgname}/docs/userman/xsb.1 "$pkgdir"/usr/share/man/man1
}

md5sums=('a8e1f068d38997aaf4cb1e9e9fca324c')
