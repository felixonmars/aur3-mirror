# Maintainer: Jörg Hansen (joerg dot hansen at gmx dot net)
# Contributor: Ole Ernst (olebowle at gmx dot com)
pkgname=eventlircd-svn
pkgver=44
pkgrel=3
pkgdesc="Eventlircd daemon providing functions for LIRC devices"
arch=('i686' 'x86_64')
url="https://code.google.com/p/eventlircd"
license=('GPL2')
depends=('libsystemd')
makedepends=('subversion')
install='eventlircd.install'
source=("$pkgname::svn+http://eventlircd.googlecode.com/svn/trunk"
        'eventlircd.service')
md5sums=('SKIP'
         '185fe36283d92c8389a9094fa4fa3028')
 
pkgver() {
    cd "$pkgname"
    svn info | grep "Revision" | cut -d' ' -f2
}
 
build() {
    cd "$pkgname"
    sed -i 's/\s\-Werror//' configure.ac
    autoreconf -vfi
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --sbindir=/usr/bin \
        --disable-dependency-tracking \
        --with-lircd-socket=/run/lirc/lircd \
        --with-evmap-dir=/etc/eventlircd.d \
        --with-udev-dir=/usr/lib/udev
    make
}
 
package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
    install -Dm644 "$srcdir/eventlircd.service" "$pkgdir/usr/lib/systemd/system/eventlircd.service"
}
