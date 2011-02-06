# Contributor: obit
pkgname=ibus-table-quick
pkgver=1.2.0.20090902
pkgrel=1
pkgdesc="The Quick Input Method for IBus Table"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://ibus.googlecode.com"
depends=('ibus' 'ibus-table' 'aspell-en' 'pyenchant')
provides=()
source=(http://ibus.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('488c33d4ae2b35aa82764cb746fe4cb4')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr --libexecdir=/usr/lib/ibus
    make || return 1
    make DESTDIR=${pkgdir} install
}
