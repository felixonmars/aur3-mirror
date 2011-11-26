pkgname=shoc
pkgver=1
pkgrel=1.2
pkgdesc="The Scalable HeterOgenous Computing Benchmark Suite"
url="http://mipt.ru"
license=('GPL')
arch=(i686)
depends=(openmpi blas libcl)
makedepends=(bzip2 gzip tar xz)
source=(http://dl.dropbox.com/u/4583032/mipt/shoc-$pkgver.$pkgrel.tar.xz)
md5sums=('7d9c86973f8efdeb18290900b29c5b41')




build() {
	cd $startdir/src/src
	for i in *
		do
			[ -d $i ] && cp -Rp $i $startdir/pkg/
		done
}


