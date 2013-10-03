# Maintainer: perlawk
pkgname=gnu-scm  
_pkgname=scm  
pkgver=5f1
pkgrel=2
pkgdesc="A Scheme implementation conforming to Revised5 Report on the Algorithmic Language Scheme and the IEEE P1178 specification*. Scm is written in C and runs under plenty different systems."
url="http://people.csail.mit.edu/jaffer/SCM"
arch=('i686' 'x86_64')
license=('LGPL')
depends=(slib)
install=.install
source=("http://groups.csail.mit.edu/mac/ftpdir/scm/${_pkgname}-$pkgver.zip")

build() {
  export SCHEME_LIBRARY_PATH=/usr/share/slib/
  cd "$srcdir/$_pkgname"

  make clean
  ./configure --prefix="$pkgdir/usr/"
 sed -i 's/<strings.h>/<string.h>/g;' findexec.c
 sed -i 's/<strings.h>/<string.h>/g;' rgx.c 
 sed -i 's/<strings.h>/<string.h>/g;' socket.c
  
  make scmlit
	make scm5
	make mydlls

}

package() {
  export SCHEME_LIBRARY_PATH=/usr/share/slib/
  cd "$srcdir/$_pkgname"
	sed -i 's/scm-$(VERSION).info/scm.info/g;' Makefile
	make install
}
md5sums=('98be8275f5c69d234c55a8a995a500dd')
