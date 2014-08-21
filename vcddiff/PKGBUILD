# Maintainer: Howard Mao <zhemao@eecs.berkeley.edu>
pkgname=vcddiff
pkgver=0.0.5
pkgrel=1
pkgdesc="A diffing tool for VCD files"
arch=('i686' 'x86_64')
url="https://github.com/palmer-dabbelt/vcddiff"
license=('GPL2')
groups=('dreamer-tools')
makedepends=('pconfigure')
source=("https://github.com/palmer-dabbelt/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('58fe7dab160fd6dac954b1762002c259')

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
