# submitter: perlawk
# Maintainer: perlawk

pkgname=ctool
pkgver=2.12
pkgrel=1
pkgdesc="CTool is a C lexer/parser with a symbol table."
url="http://ctool.sourceforge.net"
arch=('x86_64' 'i686')
license=('GPL')
makedepends=('bison' 'flex')
options=('staticlibs')
source=("http://nchc.dl.sourceforge.net/project/ctool/ctool/CTool%202.12/${pkgname}_${pkgver}.tar.gz")
 
prepare() {
  cd "${srcdir}/${pkgname}_${pkgver}"
	src="token.cpp express.cpp stemnt.cpp"
	hdr="token.h express.h stemnt.h"

	cd src/
	sed -i -r 's!^char ?\*!const char \*!g;' ${src}
	sed -i '/EXTERN int yyerr/s/ARGS((char/(const char/g;/EXTERN int yyerr/s/));/);/g;' context.cpp

	cd ../include/ctool
	sed -i -r 's!^char ?\*!char const \*!' ${hdr}
	sed -i -r 's!^void yywarn  \(char!void yywarn \(char const !; s!^int  yyerror \(char!int yyerror \(char const!; s!^int  yyerr   \(char!int  yyerr   \(char const!;' lexer.h
}

build() {
  cd "${srcdir}/${pkgname}_${pkgver}"
	./autogen.sh
	CXXFLAGS='-fpic -O' ./configure --prefix=/usr
	cd src/
  make -j4 
}
 
package() {
  cd "${srcdir}/${pkgname}_${pkgver}"
	mkdir -p "$pkgdir/usr/bin"
	cp -a bin lib include "$pkgdir/usr/"
}
md5sums=('2db3a31d7ab1f7588b042186daae6b73')
