# Contributor: Bjorn Lindeijer <bjorn lindeijer nl>
# Maintainer: Marcel Wysocki <maci@satgnu.net>

pkgname=libgrapple
pkgver=0.9.8
pkgrel=1
pkgdesc="A simple network layer for adding multiplayer features to games."
arch=('i686' 'x86_64')
url="http://opensource.linuxgamepublishing.com/grapple.php"
license=('LGPL')
depends=('openssl')
makedepends=('automake' 'autoconf' 'libtool')
source=(http://osfiles.linuxgamepublishing.com/$pkgname-$pkgver.tbz)
md5sums=('d2cd27808f100dd43bb9d4c1653790bd')

build() {
    cd $startdir/src/$pkgname-$pkgver
    libtoolize
    autoreconf
    ./configure --prefix=/usr
    make || return 1
    make DESTDIR=$startdir/pkg install

    rm $startdir/pkg/usr/lib/libgrapple.la
}
