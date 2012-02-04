# Contributor: Christopher Schwaab -- christopher.schwaab gmail
pkgname=libevocosm
pkgver=3.1.0
pkgrel=1
pkgdesc="A collection of tools for creating evolutionary algorithms."
url="http://www.coyotegulch.com/products/libevocosm/index.html"
arch=('x86_64' 'i686')
license="GPL"
depends=('libcoyotl' 'libbrahe')
#source="http://www.coyotegulch.com/distfiles/$pkgname-$pkgver.tar.bz2" # 3.3.1
source="http://www.coyotegulch.com/distfiles/$pkgname-$pkgver.tar.gz" # 3.1.0
#md5sums=('92bc04ec304ceeb37229457bf287bf3b') # 3.3.1
md5sums=('7fdc1ac67528c819cdaf9091eeee3833') # 3.1.0

build() {
        cd $pkgname-$pkgver

        sed -i '36i\
#include <string.h>' libevocosm/roulette.cpp
        ./configure --prefix=/usr || return 1
        make || return 1
        make DESTDIR="$pkgdir" install || return 1

        rm -f "$pkgdir/usr/lib/libevocosm.la"
}
