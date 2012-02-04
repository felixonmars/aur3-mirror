# Maintainer:  Matthew Bauer <mjbauer95@gmail.com>

pkgname=nomarch
pkgver=1.4
pkgrel=1
pkgdesc="Nomarch is able to extract '.arc' files."
arch=('i686' 'x86_64')
url="http://www.svgalib.org/rus/nomarch.html"
license=('GPL')
depends=()
makedepends=('gcc')
source=("ftp://ftp.ibiblio.org/pub/Linux/utils/compress/$pkgname-$pkgver.tar.gz")
md5sums=('1b0be450e2af64710f9627f85d1b0130')

build() {
	cd ${srcdir}/$pkgname-$pkgver
	make
	mkdir $pkgdir/usr
	PREFIX=$pkgdir/usr make -e install
}
