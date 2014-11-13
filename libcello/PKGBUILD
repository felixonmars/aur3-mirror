# Maintainer: ardemiranda <ardemiranda@gmail.com>

pkgname=libcello
_pkgname=libCello
pkgver=1.1.7
pkgrel=1
pkgdesc="Cello is a GNU99 C library which brings higher level programming to C"
url="http://libcello.org"
#makedepends=('nasm')
arch=('x86_64' 'i686')
license=('BSD3')
source=("http://libcello.org/static/${_pkgname}-${pkgver}.tar.gz")
md5sums=('e15c5eca89831aa5391012c85c3aaab7')

build() {
    cd $srcdir/$_pkgname-$pkgver
    make PREFIX=$pkgdir/usr
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    make PREFIX=$pkgdir/usr install
}
