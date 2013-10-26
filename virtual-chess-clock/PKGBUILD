# Maintainer: Maks Verver <maksverver@geocities.com>
pkgname=virtual-chess-clock
pkgver=1.6.0
pkgrel=1
pkgdesc="Virtual clock for two-player games like chess"
arch=('i686' 'x86_64')
url="http://vchessclock.sourceforge.net/"
license=('GPL3')
depends=('gtkmm')
makedepends=('cmake')
source=(http://downloads.sourceforge.net/vchessclock/$pkgname-$pkgver-Source.tar.gz)
md5sums=('9e3c261784ea701e3165366503690cd4')

build() {
    cd "$srcdir/$pkgname-$pkgver-Source"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver-Source"
    make DESTDIR="$pkgdir" install
}
