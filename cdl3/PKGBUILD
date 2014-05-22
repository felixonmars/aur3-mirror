# Maintainer: perlawk 
pkgname=cdl3
pkgver=1.2.8
pkgrel=1
pkgdesc="CDL3 is a programming language, based on Affix Grammars, intended for the development of compilers and other complicated pieces of software that can be implemented as syntax-directed transducers."
arch=('i686' 'x86_64')
license=('GPL')
depends=('readline')
options=('staticlibs')
url=("http://www.cs.ru.nl/cdl3/")
source=("http://ftp.cs.kun.nl/cdl3/$pkgname-$pkgver.tar.gz")

build() {
  cd $srcdir/$pkgname-$pkgver/
  ./configure --prefix=/usr
  make -j1
  cd rts
  gcc -fpic -c *.c
  gcc -shared -o libcdlrts.so cdl3rts.o flexarray.o predefrts.o 
}

package() {
  cd $srcdir/$pkgname-$pkgver/
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/include/cdl3"
  cd rts/
  cp cdl3rts.h predef.* "$pkgdir/usr/include/cdl3/"
  cp libcdlrts.so "$pkgdir/usr/lib/"
}
md5sums=('830293de7502bc0c1b9cfc8226bfab45')
