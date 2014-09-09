# Maintainer: Howard Mao <zhemao@eecs.berkeley.edu>
pkgname=flo-llvm
pkgver=0.0.14
pkgrel=2
pkgdesc="Converts Flo files to LLVM files"
arch=('i686' 'x86_64')
url="https://github.com/palmer-dabbelt/flo-llvm"
license=('GPL2')
groups=('dreamer-tools')
depends=('libflo' 'llvm' 'clang' 'lsb-release')
makedepends=('pconfigure')
source=("https://github.com/palmer-dabbelt/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('bce83719ec5fd911c94cce730fccf0b0')

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
