# Maintainer:  Elder Marco <eldermarco at gmail dot com>

pkgname=segyzip
pkgver=0.0.1
pkgrel=1
pkgdesc="Compresses SEG-Y files, especially floating-point formats"

license=('LGPL3')
url="http://sourceforge.net/projects/segyzip"
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")

arch=('i686' 'x86_64')
md5sums=('78df020cb15c3d1986c94b02372fd2cb')

build () {
    cd "$srcdir/$pkgname-$pkgver"

    ./configure --prefix=/usr
    make
}

package () {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
# expandtab:tabstop=4:shiftwidth=4
