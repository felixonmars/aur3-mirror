# Maintainer: perlawk
pkgname=slash-a
pkgver=1.0
pkgrel=1
pkgdesc="A programming language and C++ library for (quantitative) linear genetic programming."
arch=('x86_64' 'i686')
url="https://github.com/arturadib/slash-a"
license=('LGPL')
source=(slash-a-master.zip)

prepare() {
	cd "$srcdir/$pkgname-master"
  sed -i 's/#include/#include <cstdlib>\n#include/' slash/main.cpp
}

build() {
	cd "$srcdir/$pkgname-master"
  cd lib; g++ -O3 SlashA.cpp NR-ran2.cpp -shared -fpic -o libslasha.so
  cd ../slash; make
}

package() {
	cd "$srcdir/$pkgname-master"
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/lib
  mkdir -p "$pkgdir"/usr/include
  cp lib/libslasha.so "$pkgdir"/usr/lib
  cp lib/*hpp "$pkgdir"/usr/include
  cp slash/slash "$pkgdir"/usr/bin
}
md5sums=('63f6c6e07bf4a594024469677c3a5837')
