# Maintainer: Antonio Rojas <nqn76sw@gmail.com>

pkgname=cliquer
pkgver=1.21
pkgrel=1
pkgdesc="A set of C routines for finding cliques in an arbitrary weighted graph"
arch=('i686' 'x86_64')
url="http://users.aalto.fi/~pat/cliquer.html"
license=('GPL')
depends=()
makedepends=()
source=("http://users.aalto.fi/~pat/cliquer/$pkgname-$pkgver.tar.gz" 'build-lib.patch')
md5sums=('ac65de2c89134abe2be36542b9465b16'
         '6be03b4c43f948f143053fb741163f7a')

prepare() {
	cd $pkgname-$pkgver
        patch -i $srcdir/build-lib.patch
}

build() {
	cd $pkgname-$pkgver
	make
        make lib
}

package() {
	cd $pkgname-$pkgver
	mkdir -p "$pkgdir"/usr/{lib,bin,include/cliquer}
	install -m755 cl "$pkgdir"/usr/bin
	install -m755 libcliquer.so "$pkgdir"/usr/lib
	install -m755 *.h "$pkgdir"/usr/include/cliquer
}
