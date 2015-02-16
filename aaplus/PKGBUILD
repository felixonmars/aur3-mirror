# submitter: perlawk
# Maintainer: perlawk

pkgname=aaplus
pkgver=1.59
pkgrel=1
pkgdesc='AA+, a collection of freeware C++ classes which provide an implementation of the algorithms as presented in the book "Astronomical Algorithms" (2nd Edition) by Jean Meeus.'
url="http://www.naughter.com/aa.html"
arch=('x86_64' 'i686')
license=('custom')
makedepends=('cmake')
options=('staticlibs')
source=("http://www.naughter.com/download/$pkgname.zip")
 
build() {
  cd "${srcdir}"
	mkdir -p build
	cd build; cmake ..
  make -j4
}

package() {
  cd "${srcdir}"
	mkdir -p "$pkgdir/usr/include/AA"
	mkdir -p "$pkgdir/usr/share/aaplus"
	cp *htm *css "$pkgdir/usr/share/aaplus"
	cp *.h "$pkgdir/usr/include/AA"
	cd build
	cp -a lib "$pkgdir/usr/"
}
md5sums=('34777a203ce8534cb30f986469c83ea1')
