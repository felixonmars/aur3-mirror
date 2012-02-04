# Maintainer: Juan Diego Tascon

pkgname=siftfeat
pkgver=1.1.1
pkgdate_=20090108
pkgrel=2
pkgdesc="siftfeat library and utilities"
arch=(i686)
url="http://web.engr.oregonstate.edu/~hess/index.html"
depends=('opencv')
makedepends=('doxygen')
license="GPL"
source=("http://web.engr.oregonstate.edu/~hess/downloads/sift/sift-${pkgver}_${pkgdate_}.tar.gz")
md5sums=('87e2f337fe69cb4ee92954cda95969b8')
build() {
	cd ${startdir}/src/sift
	
	make || return 1

	cd lib
	ar x libfeat.a || return 1
	gcc -shared *.o -o libfeat.so || return 1
	cd ..
	
	mkdir -p ${pkgdir}/usr/{lib,bin,include} || return 1
	install -m644 lib/{libfeat.a,libfeat.so} ${pkgdir}/usr/lib/ || return 1
	install -m644 bin/* ${pkgdir}/usr/bin || return 1
	install -m644 include/*.h ${pkgdir}/usr/include || return 1
}

