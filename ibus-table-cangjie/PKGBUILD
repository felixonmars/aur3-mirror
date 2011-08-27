# Contributor: zpxing <zpxing(at)gmail(dot)com>
pkgname=ibus-table-cangjie
pkgver=1.2.0.20100119
pkgrel=1
pkgdesc="The Cangjie Input Method for IBus Table"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://ibus.googlecode.com"
depends=('ibus' 'ibus-table' 'aspell-en' 'pyenchant')
provides=('ibus-table-cangjie=1.1.0')
source=(http://ibus.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('25be75b2ae9435bd6cb943d3b4d7d609')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr --libexecdir=/usr/lib/ibus
    make || return 1
    make DESTDIR=${pkgdir} install
}
