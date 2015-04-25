# Maintainer: Thomas Nixon <tom@tomn.co.uk>
pkgname=ltc-tools
pkgver=0.6.4
pkgrel=0
pkgdesc="commandline tools to deal with linear-timecode (LTC)"
arch=("any")
url="https://github.com/x42/ltc-tools"
license=('GPL')
depends=(libltc jack)
source=(https://github.com/x42/ltc-tools/archive/v$pkgver.tar.gz)
md5sums=(8917ae4dd6041348c14e86d5d2ca4242)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install DESTDIR=$pkgdir PREFIX=/usr
}
