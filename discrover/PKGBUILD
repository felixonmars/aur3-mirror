# Maintainer: Jonas Maaskola <jonas@maaskola.de>
pkgname=discrover
pkgver=1.6.0
pkgrel=1
pkgdesc="Binding site pattern discovery from nucleic acid sequences by discriminative learning of hidden Markov models"
arch=('x86_64')
url="https://github.com/maaskola/discrover"
license=('GPL3')
depends=('boost' 'cairo')
makedepends=('cmake' 'gcc' 'boost' 'texlive-latexextra' 'cairo')
changelog=
source=(https://github.com/maaskola/discrover/archive/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('a60dc9ca158acc12ac966f0f989eb832')

build() {
	cd "$srcdir/$pkgname-$pkgver"
        mkdir -p build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
        mkdir -p build
        cd build
	make DESTDIR="$pkgdir/" install
}
