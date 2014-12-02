# Maintainer: Luka Perkov <luka.perkov@sartura.hr>

pkgname=libroxml
pkgver=2.3.0
pkgrel=1
pkgdesc='Light C XML parsing library'
url='http://libroxml.net/'
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('cmake' 'make' 'gcc')
provides=('libroxml')
source=("http://download.libroxml.net/pool/v2.x/$pkgname-$pkgver.tar.gz")
md5sums=('a975f91be150f7a19168a45ce15769ca')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	cmake CMakeLists.txt \
		-DCMAKE_INSTALL_PREFIX:PATH=/usr

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install
}

# burp -c lib `ls libroxml-*.src.tar.gz | sort | tail -1`
