# Maintainer: Howard Mao <zhemao@eecs.berkeley.edu>
pkgname=libdrasm
pkgver=0.0.1
pkgrel=1
pkgdesc="DREAMER Assembly Library"
arch=('i686' 'x86_64')
url="https://github.com/palmer-dabbelt/libdrasm"
license=('GPL2')
groups=('dreamer-tools')
makedepends=('pconfigure')
depends=('libflo' 'libocn')
source=("https://github.com/palmer-dabbelt/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('47c0aff0e9d05d4b8ec046f10211f797')

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
