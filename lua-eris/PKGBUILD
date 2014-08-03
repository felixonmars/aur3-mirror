# Maintainer: Stephan Henrichs < stiepen 22 {at} gmx (dot) de>
pkgname='lua-eris'
pkgver='1.0.0'
pkgrel=1
pkgdesc="A lua fork with persistance"
arch=('i686' 'x86_64')
url='https://github.com/fnuecke/eris'
license=('MIT')
depends=('readline')
provides=('lua')
conflicts=('lua')
source=("lua-eris-$pkgver::git+https://github.com/fnuecke/eris.git#tag=v$pkgver" "main.patch")
md5sums=('SKIP'
         '086172a34f84e3c289ccece504f94e9e')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 -i "$srcdir/main.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make linux
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make "DESTDIR=$pkgdir/" install
}

#check() {
#    make -k test
#}
