# Maintainer: perlawk

pkgname=vsl
_pkgname=VSL-master
pkgver=1.0
pkgrel=1
pkgdesc="VSL is the very simple language from the compiler text book: Introduction to compiling techniques by J.P. Bennett"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/perlawk/VSL"
depends=('glibc' 'm4' 'sh')
groups=('base-devel')
options=('staticlibs')
source=("https://codeload.github.com/perlawk/VSL/zip/master")

prepare() {
  cd ${srcdir}/${_pkgname}
	sed -i 's!../lib!/usr/share/vsl/lib!;' code/vc.h
	sed -i 's!./v!/usr/bin/v!;' code/vsl
}

build() {
  cd ${srcdir}/${_pkgname}
	cd code 
  make
}

package() {
  cd ${srcdir}/${_pkgname}
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/vsl"

	cd code; cp vc vsl vas vam "$pkgdir/usr/bin"
	cd ../;  cp -a sample doc lib "$pkgdir/usr/share/vsl"
}
md5sums=('4350456779c9d3ec1fcbff5363de5ccd')
