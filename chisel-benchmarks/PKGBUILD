# Maintainer: Howard Mao <zhemao@eecs.berkeley.edu>
pkgname=chisel-benchmarks
pkgver=20140821
pkgrel=1
pkgdesc="Benchmarks for Chisel"
arch=('any')
url="https://github.com/palmer-dabbelt/chisel-benchmarks"
license=('GPL2')
groups=('dreamer-tools')
makedepends=('pconfigure')
depends=('sbt')
source=("https://github.com/palmer-dabbelt/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('839a79d9d41bee5fbce15541f5d80316')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    echo "PREFIX = /usr" > Configfile.local
    echo "LANGUAGES += c" >> Configfile.local
    echo "COMPILEOPTS += -DNDEBUG" >> Configfile.local
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
