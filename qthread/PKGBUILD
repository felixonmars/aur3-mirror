# Maintainer: Speedx <guhee1991@163.com>
pkgname=qthread
pkgver=1.7
pkgrel=1
pkgdesc="The qthreads API is designed to make using large numbers of threads convenient and easy, and to allow portable access to threading constructs used in massively parallel shared memory environments."
arch=('i686' 'x86_64')
url="http://www.cs.sandia.gov/qthreads/"
license=('custom')
makedepends=('make' 'gcc')
source="http://qthreads.googlecode.com/files/$pkgname-$pkgver.tar.bz2"
md5sums=('83f01a920dbf5adab313a4e70609016d')

build() {
	cd "$srcdir"/"$pkgname-$pkgver"
	./configure --prefix=/usr
	make

	install -m755 -d $startdir/pkg/usr/share/licenses/qthread
	install -m644 $startdir/COPYING $startdir/pkg/usr/share/licenses/qthread/
}

package() {
	cd "$srcdir"/$pkgname-$pkgver
	make prefix="$pkgdir"/usr install
}
