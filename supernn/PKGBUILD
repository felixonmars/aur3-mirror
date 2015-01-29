# Maintainer: Lucas Hermann Negri <lucashnegri@gmail.com>

pkgname=supernn
pkgver=1.0.0
pkgrel=1
pkgdesc="Artificial neural network library"
arch=('i686' 'x86_64')
url="http://oproj.tuxfamily.org" 
depends=()
makedepends=('gcc' 'cmake' 'eigen')
license=(LGPL)
source=("https://bitbucket.org/lucashnegri/$pkgname/downloads/$pkgname-$pkgver-src.tar.gz")
md5sums=("bcc2f58e393007fcd7a890fb83605817")

build() { 
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ..
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    make install
}
