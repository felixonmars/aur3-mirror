# Maintainer: perlawk

pkgname=fcac
pkgver=1.0
pkgrel=1
pkgdesc="Fast Combinatorial Algorithms in C"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.aconnect.de/friends/editions/computer/combinatoricode_e.html"
source=( 
"http://www.aconnect.de/friends/editions/computer/generate/generate.zip"
Makefile
)

build() {
  cd "$srcdir"
	for f in *c 
	do
		sed -i 's/_generate.h/fcac.h/g;' $f
	done
	mv _generate.h fcac.h
  make
}

package() {
  cd "$srcdir"
	mkdir -p "$pkgdir"/usr/lib
	mkdir -p "$pkgdir"/usr/include
	cp libfcac.so "$pkgdir"/usr/lib
	cp fcac.h "$pkgdir"/usr/include
}
md5sums=('c2c517685a1ca239e10dd44ac3636931'
         '2292b0a3611ba9b7bd7b76c7ad6b3bac')
