# Maintainer: Your Name <youremail@domain.com>
pkgname=libflo
pkgver=0.0.16
pkgrel=2
pkgdesc="A C++ library for parsing Flo files"
arch=('i686' 'x86_64')
url="https://github.com/palmer-dabbelt/libflo"
license=('GPL2')
groups=('dreamer-tools')
makedepends=('pconfigure')
source=("https://github.com/palmer-dabbelt/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('616a8cc2fd7b8d2483d79848c2f1c7d6')

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
