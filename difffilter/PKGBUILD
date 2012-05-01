# Maintainer: Nathan Phillip Brink <binki@gentoo.org>

pkgname=difffilter
pkgver=0.3.3
PN=${pkgname}
P=${PN}-${pkgver}
pkgrel=1
pkgdesc="Filter files out of unified diffs using POSIX extended regular expressions"
url=http://ohnopub.net/~ohnobinki/difffilter
license=(GPL-3)
source=(ftp://mirror.ohnopub.net/mirror/${PN}/${P}.tar.bz2 ftp://mirror.ohnopub.net/mirror/${PN}/${P}.tar.bz2.asc)
md5sums=(d2478333dddcf7a0cf114bd230cba46b 6356656fed4ee58b4f89b4d4a07e4465)
arch=(i686 x86_64)
depends=(glibc liblist libstrl tre)
checkdepends=(check)
makedepends=(pkg-config txt2man)
options=(!libtool)

build() {
    cd "${srcdir}"/${P}
    ./configure --prefix=/usr 
    make
}

check() {
    make -C "${srcdir}"/${P} check
}

package() {
    make -C "${srcdir}"/${P} DESTDIR="${pkgdir}" install
}
