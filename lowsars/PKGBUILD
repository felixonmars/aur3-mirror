# Maintainer: Arapat <find0123 at gmail dot com>
pkgname=lowsars
pkgver=0.2.1
pkgrel=1
pkgdesc="Lightweight OI Wonderful Scoring and Ranking System"
arch=('i686' 'x86_64')
license=('GPL')
url="http://lowsars.sourceforge.net"
depends=('bash>=3.0' 'coreutils' 'bc' 'gettext')
source=(http://ncu.dl.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('e5d5ee1f7b45ca679b4b5e373b09395b')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    sed -i "s@/usr/local@/usr@" configure
    ./configure

    make || return 1
    make DESTDIR=${pkgdir} install || return 1
}
