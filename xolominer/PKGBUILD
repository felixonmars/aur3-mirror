# Maintainer: Timmy Weerwag <timmy@timmyweerwag.nl>
pkgname=xolominer
_gitname=primecoin
pkgver=0.9.ab9f5cf
pkgrel=1
pkgdesc="Primecoin miner for beeeeer.org"
arch=('x86_64' 'i686')
url="https://github.com/thbaumbach/primecoin"
license=('MIT')
depends=('gmp' 'openssl')
makedepends=('git' 'cmake' 'boost')
source=('git+https://github.com/thbaumbach/primecoin.git#branch=experimental')
md5sums=(SKIP)

build() {
    cd "$srcdir/${_gitname}"
    cmake .
    make
}

package() {
    cd "$srcdir/${_gitname}"
    install -Dm755 xolominer "$pkgdir/usr/bin/xolominer"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

pkgver() {
    cd "$srcdir/${_gitname}"
    echo "${pkgver}.$(git rev-parse --short HEAD)"
}
