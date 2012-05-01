# Maintainer: Nathan Phillip Brink <binki@gentoo.org>

pkgname=liblist
pkgver=2.4
P=${pkgname}-${pkgver}
pkgrel=1
pkgdesc="Generic linked-list manipulation routines, plus queues and stacks"
url=http://ohnopub.net/~ohnobinki/liblist
license=(GPL-2)
source=(ftp://mirror.ohnopub.net/mirror/${P}.tar.bz2 ftp://mirror.ohnopub.net/mirror/${P}.tar.bz2.asc)
md5sums=(d3053b04914faebbe338782906777b52 6bedfc78b8dbda6fa7f07fa303816d6e)
arch=(i686 x86_64)
depends=(glibc)
makedepends=(libtool pkg-config)
options=(!libtool)

build() {
    cd "${srcdir}"/${P}
    ./configure --prefix=/usr --disable-docs --disable-examples
    make
}

package() {
    make -C "${srcdir}"/${P} DESTDIR="${pkgdir}" install
}
