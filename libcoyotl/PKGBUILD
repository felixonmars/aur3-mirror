# Contributor: Christopher Schwaab -- christopher.schwaab gmail
pkgname=libcoyotl
pkgver=3.1.0
pkgrel=2
pkgdesc="A library of various utility classes used by acovea."
url="http://www.coyotegulch.com/products/libcoyotl/index.html"
arch=('x86_64' 'i686')
license="GPL"
depends=('libpng')
source="http://www.coyotegulch.com/distfiles/libcoyotl-3.1.0.tar.gz"
md5sums=('5c1d9cfce494f123f52c399b39925bdb')

build() {
        cd $pkgname-$pkgver

        sed -i '34i\
#include <string.h>' libcoyotl/command_line.cpp
        sed -i '38i\
#include <limits.h>' libcoyotl/sortutil.h
        ./configure --prefix=/usr || return 1
        make || return 1
        make DESTDIR="$pkgdir" install || return 1

        rm "$pkgdir/usr/lib/libcoyotl.la"
}
