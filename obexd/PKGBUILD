# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=obexd
pkgver=0.48
pkgrel=1
pkgdesc="OBEX Server"
arch=('x86_64' 'i686' 'armv7h')
url="http://www.bluez.org"
license=('GPL2')
depends=(bluez)
source=(http://www.kernel.org/pub/linux/bluetooth/${pkgname}-${pkgver}.tar.xz
    systypes.patch)
sha256sums=('6dfd10e1444b0d8a66f2d745d70336cd28e533e893a48f69879c4bb6d079edfb'
    '77ba9737e2a46db7999b2feedcaa972b8123a955899ea642f1fe2c6614e8d427')

build() {
    cd ${pkgname}-${pkgver}
    ./configure \
    	--prefix=/usr \
        --mandir=/usr/share/man \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --libexecdir=/usr/lib
    make
}

check() {
    cd $pkgname-$pkgver
    make check
}

package() {
    cd ${pkgbase}-${pkgver}
    make DESTDIR=${pkgdir} install
}
