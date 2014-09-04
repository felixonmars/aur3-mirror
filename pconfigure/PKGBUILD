# Maintainer: Howard Mao <zhemao@eecs.berkeley.edu>
pkgname=pconfigure
pkgver=0.8.1
pkgrel=1
pkgdesc="A Simple Autoconf/Automake Replacement"
arch=(i686 x86_64)
url="https://github.com/palmer-dabbelt/pconfigure"
license=('AGPL')
source=("https://github.com/palmer-dabbelt/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('b650ce7ab8d8af97337293771bd172b9')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    rm -f Configfiles/local
    ./bootstrap.sh --prefix /usr
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make D="$pkgdir/" install
}
