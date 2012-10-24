# Upstream Maintainer: kennytm <kennytm@gmail.com>
# Contributor: kennytm <kennytm@gmail.com>
# Maintainer: Fantix King <fantix.king at gmail.com>

_pkgbasename=zeromq
pkgname=libx32-$_pkgbasename
pkgver=2.2.0
pkgrel=1.1
pkgdesc="Fast messaging system built on sockets, C and C++ bindings. aka 0MQ, ZMQ. (x32 ABI)"
arch=('x86_64')
url="http://www.zeromq.org"
license=('LGPL')
depends=('libx32-gcc-libs' 'libx32-util-linux' "${_pkgbasename}=${pkgver}")
makedepends=('gcc-multilib-x32')
source=(http://download.zeromq.org/$_pkgbasename-$pkgver.tar.gz)
md5sums=('1b11aae09b19d18276d0717b2ea288f6')

build() {
    cd "$srcdir/$_pkgbasename-$pkgver"
    export CC="gcc -mx32"
    export CXX="g++ -mx32"
    #export PKG_CONFIG_PATH='/usr/libx32/pkgconfig'
    ./configure --prefix=/usr --libdir=/usr/libx32 \
        --with-pgm --without-documentation
    sed -i 's/python$/&2/' foreign/openpgm/build-staging/openpgm/pgm/{Makefile,version_generator.py}
    make
}

package() {
    cd "$srcdir/$_pkgbasename-$pkgver"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir/usr/"{include,share}
}

