pkgname=tetgen
pkgver=1.5.0
pkgrel=2
pkgdesc="A Quality Tetrahedral Mesh Generator"
arch=('i686' 'x86_64')
url="http://wias-berlin.de/"
license=('AGPL3')
source=(http://wias-berlin.de/software/tetgen/1.5/src/${pkgname}${pkgver}.tar.gz)
md5sums=('3b9fd9cdec121e52527b0308f7aad5c1')

build() {
    cd "$srcdir/$pkgname$pkgver"
    make && make tetlib || return 1
}

package() {
    cd "$srcdir/$pkgname$pkgver"
    install -D -m 755 tetgen ${pkgdir}/usr/bin/tetgen
    install -D -m 644 libtet.a ${pkgdir}/usr/bin/libtet.a
}

