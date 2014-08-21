# Maintainer: Howard Mao <zhemao@eecs.berkeley.edu>
pkgname=libocn
pkgver=0.0.4
pkgrel=2
pkgdesc="An on-chip network library"
arch=('i686' 'x86_64')
url="https://github.com/palmer-dabbelt/libocn"
license=('GPL2')
groups=('dreamer-tools')
makedepends=('pconfigure')
depends=('graphviz')
source=("https://github.com/palmer-dabbelt/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('a958af16b32d4ec08c75a99c56942d0a')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    echo "PREFIX = /usr" > Configfile.local
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    pconfigure
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make D="$pkgdir" install
}
