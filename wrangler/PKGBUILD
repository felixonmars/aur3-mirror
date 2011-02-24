# Maintainer: Pawel 'kTT' Salata <rockplayer.pl@gmail.com>
pkgname=wrangler
pkgver=0.9.2
_main_version=0.9
pkgrel=2
pkgdesc="An Erlang refactoring tool."
arch=(any)
url="http://www.cs.kent.ac.uk/projects/forse/"
license=('BSD')
groups=(devel)
depends=('erlang' )
makedepends=('gcc' 'make')
source=(http://www.cs.kent.ac.uk/projects/forse/wrangler/$pkgname-$_main_version/$pkgname-$pkgver.tar.gz)
md5sums=('0b6f46bb3dcf7d1f15632ab50f6d59fc')
build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=$pkgdir/usr
    make
    install -Dm755 LICENCE $pkgdir/usr/share/licenses/$pkgname/license.txt || return 1
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
