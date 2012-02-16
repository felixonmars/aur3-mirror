# Maintainer: Auguste Pop <auguste [at] gmail [dot] com>

pkgname=mingw32-qrencode
_opkgname=${pkgname#*-}
pkgver=3.2.0
pkgrel=3
pkgdesc="C library for encoding data in a QR Code symbol (mingw32)"
arch=('any')
url="http://megaui.net/fukuchi/works/qrencode/index.en.html"
license=('GPL')
depends=(mingw32-runtime mingw32-pthreads)
makedepends=(mingw32-gcc)
options=(!strip !buildflags !libtool)
source=("http://megaui.net/fukuchi/works/$_opkgname/$_opkgname-$pkgver.tar.bz2")
md5sums=('7e90615eb314abcd2eb2eab5c8155b97')

build()
{
    cd "$srcdir/$_opkgname-$pkgver"
    unset CFLAGS
    unset LDFLAGS
    ./configure --prefix=/usr/i486-mingw32 --host=i486-mingw32 \
        --without-tools
    make
}

package()
{
    cd "$srcdir/$_opkgname-$pkgver"
    make DESTDIR=$pkgdir install
    rm -rf $pkgdir/usr/i486-mingw32/share
}
