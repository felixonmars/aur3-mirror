pkgname=rpl2
pkgver=4.0.23
pkgrel=1
pkgdesc="rpl/2: trimmed version, command line and repl only. RPL/2 is a programming language cloning the HP28S system/user language. V4.1 and later are too
big and buggy, please don't request any update unless broken of compilation."
arch=('i686' 'x86_64')
url="http://www.rpl2.net"
license=('GPL')
makedepends=('sharutils' 'readline' 'ncurses' 'gsl' 'units' 'gcc-fortran')
options=('docs' 'staticlibs' '!strip')
conflicts=('rpl')
source=("http://www.rpl2.net/download/rpl-4.0.23.tar.bz2"
"hello.rpl")


build() {
  cd ${srcdir}/${pkgname}-${pkgver}/
	./configure --prefix=/usr --disable-gnuplot --disable-motif --enable-embedded-gnuplot --enable-tex --disable-sysv-ipcs --without-x --without-mysql --without-postgresql
	make -j4
}

check() {
  cd ${srcdir}/${pkgname}-${pkgver}/
	echo Run rpl hello.rpl after installation of the program
	echo else will failed due to security check of the program itself.
:wq
#	./src/rpl "$srcdir"/hello.rpl
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/
	make DESTDIR="$pkgdir" install
}
md5sums=('3905c44f5f053bdb4a3fe43bcf80163c'
         'fdd03d8a4065a606e371d4dbb35e7254')
