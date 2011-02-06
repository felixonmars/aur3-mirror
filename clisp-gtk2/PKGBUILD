# Contributor: Brian O'Hanlon <brainpo@gmail.com>
pkgname=clisp-gtk2
pkgver=2.49
pkgrel=3
pkgdesc="ANSI Common Lisp interpreter, compiler and debugger (with gtk2 enabled)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://clisp.cons.org/"
depends=('readline' 'libsigsegv' 'gtk2' 'ffcall')
makedepends=('ffcall')
conflicts=('clisp')
provides=('clisp' 'common-lisp')
options=('!makeflags')
source=(http://downloads.sourceforge.net/clisp/clisp-${pkgver}.tar.bz2)
md5sums=('1962b99d5e530390ec3829236d168649')


build() {
  cd ${srcdir}/clisp-${pkgver}
  unset CFLAGS CXXFLAGS
  ./configure --prefix=/usr \
                --with-module=clx/new-clx \
                --with-module=pcre \
                --with-module=bindings/glibc --with-module=gtk2 \
                --with-module=queens --with-module=rawsock \
                --with-module=zlib \
                --cbc build  
#--with-threads=POSIX_THREADS
  cd build
  make || return 1
  sed -i 's,http://www.lisp.org/HyperSpec/,http://www.lispworks.com/reference/HyperSpec/,g' config.lisp
  make || return 1
  make DESTDIR=$pkgdir install || return 1

}
