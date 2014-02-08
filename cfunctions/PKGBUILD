# submitter: perlawk
# Maintainer: perlawk

pkgname=cfunctions
pkgver=0.28
pkgrel=1
pkgdesc="Cfunctions is a C programming utility which makes C header files from C program files by extracting function prototypes, global variables and tag tables from C files."
url="http://www.lemoda.net/c/cfunctions/"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=()
source=("http://ncu.dl.sourceforge.net/project/cfunctions/cfunctions/cfunctions-0.28.tar.bz2" )
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
  make
}
 
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/cfunctions" 
  mkdir -p "${pkgdir}/usr/share/man/man1" 
  mkdir -p "${pkgdir}/usr/share/info" 

	/usr/bin/install -c src/cfunctions "${pkgdir}/usr/bin"
	/usr/bin/install -c -m 644 src/c-extensions.h ${pkgdir}/usr/share/cfunctions
	/usr/bin/install -c -m 644 doc/cfunctions.1 ${pkgdir}/usr/share/man/man1
	/usr/bin/install -c -m 644 doc/cfunctions.info* ${pkgdir}/usr/share/info
}
md5sums=('223d1f7f28d78d05e580d753925c44c5')
