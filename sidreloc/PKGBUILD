# Maintainer: lobotomius at gmail dot com

pkgname=sidreloc
pkgver=1.0
pkgrel=1
pkgdesc="SID music relocator"
arch=('i686' 'x86_64')
url="http://www.linusakesson.net/software/sidreloc/"
license=('MIT')
makedepends=()
source=("http://hd1.linusakesson.net/files/sidreloc-1.0.tgz")
md5sums=('987cac9c5c5e210eee897f4689aea002')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make

}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    install -m 755 sidreloc "$pkgdir/usr/bin"

}


