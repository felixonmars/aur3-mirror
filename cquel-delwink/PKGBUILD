# Maintainer: David McMackins <david@delwink.com>
pkgname=cquel-delwink
pkgver=0.1
pkgrel=2
pkgdesc="MySQL C API wrapper with dynamic data structures (Delwink Edition)"
arch=('any')
url="http://git.delwink.com/git/summary/cquel.git"
license=('AGPL3')
depends=('icu' 'mariadb-clients')
provides=('cquel')
source=("http://delwink.com/dl/cquel-$pkgver.tar.gz")
md5sums=('68d167780484808f88a02971a30818e9')

build() {
    cd "$srcdir"
    ./autogen.sh
    ./configure
    make
}

package() {
    cd "$srcdir"
    make DESTDIR=$pkgdir prefix=/usr install
}
