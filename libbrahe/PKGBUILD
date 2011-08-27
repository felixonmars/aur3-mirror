# Contributor: Christopher Schwaab -- christopher.schwaab gmail
pkgname=libbrahe
pkgver=1.1.0
pkgrel=1
pkgdesc="A collection of auxiliary mathematic functions."
url="http://www.coyotegulch.com/products/brahe/"
arch=('x86_64' 'i686')
license="GPL"
depends=('glibc')
source="http://www.coyotegulch.com/distfiles/$pkgname-$pkgver.tar.gz"
md5sums=('6b02428844db18f8c51e2857346fe132')

build() {
        cd $pkgname-$pkgver

        ./configure --prefix=/usr || return 1
        make || return 1
        make DESTDIR="$pkgdir" install || return 1

        rm -f "$pkgdir/usr/lib/libbrahe.la"
}
