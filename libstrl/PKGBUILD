# Maintainer: Nathan Phillip Brink <binki@gentoo.org>

pkgname=libstrl
pkgver=0.5.1
P=${pkgname}-${pkgver}
pkgrel=1
pkgdesc="Implementations of certain GNU-only or BSD-only string-related libc functions, such as strlcpy() and getdelim(), for compat purposes"
url=http://ohnopub.net/~ohnobinki/libstrl
license=(LGPL-3)
source=(ftp://mirror.ohnopub.net/mirror/${P}.tar.bz2 ftp://mirror.ohnopub.net/mirror/${P}.tar.bz2.asc)
md5sums=(d22fcd8107526d802428be6f0e8f0f60 8582feb197b032374a7bf519a558856c)
arch=(i686 x86_64)
depends=(glibc)
makedepends=(doxygen libtool pkg-config)
checkdepends=(check)
options=(!libtool)

build() {
    cd "${srcdir}"/${P}
    ./configure --prefix=/usr --with-doxygen
    make
}

check() {
    make -C "${srcdir}"/${P} check
}

package() {
    make -C "${srcdir}"/${P} DESTDIR="${pkgdir}" install
}
