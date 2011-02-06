# Contributor: Christopher Schwaab -- christopher.schwaab gmail
pkgname=libacovea
pkgver=5.1.1
pkgrel=1
pkgdesc="A genetic algorithm to find the 'best' options for compiling programs."
url="http://www.coyotegulch.com/products/acovea/index.html"
arch=('x86_64' 'i686')
license="GPL"
depends=('expat' 'libevocosm=3.1.0')
source="http://www.coyotegulch.com/distfiles/$pkgname-$pkgver.tar.gz"
md5sums=('e3bfa6b782205bad083ba58a8b882158')

build() {
        cd $pkgname-$pkgver

        ./configure --prefix=/usr || return 1
        make || return 1
        make DESTDIR="$pkgdir" install || return 1

        rm -f "$pkgdir/usr/lib/libacovea.la"
}
