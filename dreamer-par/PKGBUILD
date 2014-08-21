# Maintainer: Howard Mao <zhemao@eecs.berkeley.edu>
pkgname=dreamer-par
pkgver=0.0.3
pkgrel=1
pkgdesc="Place and Route for DREAMER"
arch=('i686' 'x86_64')
url="https://github.com/palmer-dabbelt/dreamer-par"
license=('GPL2')
groups=('dreamer-tools')
makedepends=('pconfigure' 'libdrasm')
source=("https://github.com/palmer-dabbelt/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('c32c7ad73ea422bb62591b3252a00c8f')

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
