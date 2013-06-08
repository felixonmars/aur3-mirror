# Maintainer: Siôn Le Roux <sinisterstuf@gmail.com>

pkgname=tomboy-todo
pkgver=1.0.0
pkgrel=1
pkgdesc="A tomboy plugin to highlight markers such as FIXME, TODO and XXX."
url="http://romain.blogreen.org/projects/tomboy-todo/"
depends=('tomboy')
arch=(any)
license=(Apache)
source=("http://romain.blogreen.org/distfiles/tomboy-todo-1.0.0.tar.gz")
md5sums=('29faed483b68354aef8f86e9303c5a9f')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    make check
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
