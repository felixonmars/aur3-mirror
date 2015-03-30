# Maintainer: Paul Staab <develop(at)paulstaab(dot)de>

pkgname=scrm
pkgver=1.4.0
pkgrel=1
pkgdesc="A Coalescent Simulator for Genome-Scale Biological Sequences"
arch=('i686' 'x86_64' 'armv7h')
url="https://scrm.github.io"
license=('GPL3')
depends=('gcc-libs')
makedepends=('gcc>=4.8.1')
checkdepends=('cppunit')
source=("https://scrm.github.io/releases/scrm-$pkgver.tar.gz")
sha512sums=('46f981d4c00bed96857c130fdd2bb8b9d42ce960b85fe808051618a4ed11ee35be29e732816c7fc76a738a7b951d7a89ac7c8fdc36e25bb6e9de7d5e30dbd521')
md5sums=('7d44058c3dcf72a763578b0f77253921')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k unittests
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
