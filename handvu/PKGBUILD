# Contributor: Juan Diego Tascon

pkgname=handvu
pkgver=beta3
pkgrel=1
pkgdesc="vision-based hand gesture interface"

arch=('i686' 'x86_64')
url="http://www.movesinstitute.org/~kolsch/HandVu/HandVu.html"
license=('GPL')

depends=('opencv')

source=("http://www.movesinstitute.org/~kolsch/HandVu/handvu-${pkgver}.tar.gz" "gcc4.4-compile.patch")
md5sums=('94b3b63ab21f79f390a7a6c712a0b67b' '878b884e55aaa5d6c5287573f1d7cefd')

build() {
	cd $srcdir/handvu-${pkgver}
	
	patch -p1 < ../gcc4.4-compile.patch
	
	./configure --prefix=/usr || return 1
	make || return 1
	make DESTDIR=$pkgdir install || return 1
}

