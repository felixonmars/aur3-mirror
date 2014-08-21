# Maintainer: Howard Mao <zhemao@eecs.berkeley.edu>
pkgname=chisel-torture
pkgver=0.0.2
pkgrel=1
pkgdesc="A random Chisel graph generator"
arch=('i686' 'x86_64')
url="https://github.com/palmer-dabbelt/chisel-torture"
license=('GPL2')
groups=('dreamer-tools')
depends=('libflo' 'gmp')
makedepends=('pconfigure')
source=("https://github.com/palmer-dabbelt/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('ea2268f55b2938cb19611814fbfdacd5')

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
	make DESTDIR="$pkgdir/" install
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make D="$pkgdir" install
}
