# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=obexd-git
pkgver=0.48.r0.g563b186
pkgrel=1
pkgdesc="OBEX Server (git version)"
arch=('x86_64' 'i686' 'armv7h')
url="http://www.bluez.org"
license=('GPL2')
depends=(bluez)
source=("$pkgname"::'git+git://git.kernel.org/pub/scm/bluetooth/obexd.git'
    systypes.patch)
sha256sums=('SKIP'
        '77ba9737e2a46db7999b2feedcaa972b8123a955899ea642f1fe2c6614e8d427')

pkgver() {
    cd ${pkgname}
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd ${pkgname}
    patch -p1 < ../../systypes.patch
    ./bootstrap
    ./configure \
    	--prefix=/usr \
        --mandir=/usr/share/man \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --libexecdir=/usr/lib
    make
}

check() {
    cd ${pkgname}
    make check
}

package() {
    cd ${pkgname}
    make DESTDIR=${pkgdir} install
}
