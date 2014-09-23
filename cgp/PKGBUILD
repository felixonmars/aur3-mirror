# Maintainer: perlawk
pkgname=cgp
_pkgname=CGP
pkgver=1.0
pkgrel=1
pkgdesc="A cross platform Cartesian Genetic Programming Library written in C."
arch=('x86_64' 'i686')
url="http://www.cgplibrary.co.uk"
license=('LGPL')
source=("https://codeload.github.com/AndrewJamesTurner/CGP-Library/zip/master")

prepare() {
	cd "$srcdir/$_pkgname-Library-master"
}

build() {
	cd "$srcdir/$_pkgname-Library-master"
  cd src
  gcc -o libcgp.so cgp.c -shared -fpic
}

package() {
	cd "$srcdir/$_pkgname-Library-master"/src
  mkdir -p "$pkgdir"/usr/lib
  mkdir -p "$pkgdir"/usr/include
  cp libcgp.so "$pkgdir"/usr/lib
  cp cgp.h "$pkgdir"/usr/include
}
md5sums=('fba21352e6ee28566c9890e6f436fd47')
