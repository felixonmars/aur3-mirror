# Maintainer: Howard Mao <zhemao@eecs.berkeley.edu>
pkgname=vcd2step
pkgver=0.0.2
pkgrel=1
pkgdesc="Converts VCD files to Chisel tester inputs"
arch=('i686' 'x86_64')
url="https://github.com/palmer-dabbelt/vcd2step"
license=('GPL2')
groups=('dreamer-tools')
makedepends=('pconfigure')
depends=('libflo' 'vcddiff' 'gmp')
source=("https://github.com/palmer-dabbelt/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('c2d1ea112f794d2274a8f5a330d32cb8')

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
