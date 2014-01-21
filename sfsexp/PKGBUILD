# submitter: perlawk
# Maintainer: perlawk

pkgname=sfsexp
_pkgname=sexpr
pkgver=1.3
pkgrel=1
pkgdesc="SFSEXP: Small Fast S-Expression Library."
url="http://sexpr.sourceforge.net/"
arch=('x86_64' 'i686')
license=('GPLv3')
options=(staticlibs)
source=("http://jaist.dl.sourceforge.net/project/sexpr/sexpr/$pkgver/${_pkgname}-${pkgver}.tar.gz")
 
build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
	CFLAGS=-fPIC ./configure --prefix=/usr
  make
	cd src; gcc -shared -o libsexpr.so *.o
}
 
package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
	cp src/libsexpr.so "$pkgdir"/usr/lib
}
md5sums=('07df7d012dd857af7f641fb6ba26c01d')
