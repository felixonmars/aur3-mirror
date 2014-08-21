# Maintainer: Howard Mao <zhemao@eecs.berkeley.edu>
pkgname=flo-mwe
pkgver=0.0.6
pkgrel=1
pkgdesc="Flo multi-word expander"
arch=('i686' 'x86_64')
url="https://github.com/palmer-dabbelt/flo-mwe"
license=('GPL2')
groups=('dreamer-tools')
makedepends=('pconfigure')
depends=('libflo')
source=("https://github.com/palmer-dabbelt/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('3765936140eb990a9dbe0494b598d26e')

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
