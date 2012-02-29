pkgname=pure-stlvec
pkgver=0.1
pkgrel=1
pkgdesc="This package provides an interface to one of the most useful containers (vector) of the C++ Standard Template Library, adopted to hold pointers to Pure expressions."
arch=("i686" "x86_64")
license=('GPL3')
url="http://code.google.com/p/pure-lang"
depends=('pure')
makedepends=('make' 'gcc')
source=("http://pure-lang.googlecode.com/files/$pkgname-$pkgver.tar.gz")

build() {
	cd $startdir/src/$pkgname-$pkgver

	make || return 1
	make DESTDIR=$startdir/pkg install || return 1
}
md5sums=('4e07f5e1520a96bab344f50e3ebebe87')
