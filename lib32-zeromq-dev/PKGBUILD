# Maintainer: kennytm <kennytm@gmail.com>
# Contributor: kennytm <kennytm@gmail.com>

_pkgbasename=zeromq
pkgname=lib32-$_pkgbasename-dev
pkgver=3.1.0
pkgrel=1
pkgdesc="Fast messaging system built on sockets, the 3.1 beta version. aka 0MQ, ZMQ. (32-bit)"
arch=('x86_64')
url="http://www.zeromq.org"
license=('LGPL')
depends=('lib32-gcc-libs' 'lib32-util-linux' 'zeromq-dev')
makedepends=('gcc-multilib')
source=(http://download.zeromq.org/$_pkgbasename-$pkgver-beta.tar.gz)
md5sums=('c9615e4442b325bd0c23a8205e380c40')
provides=("lib32-zeromq")
conflicts=("lib32-zeromq")

build() {
    cd "$srcdir/$_pkgbasename-$pkgver"
    export CC="gcc -m32"
    export CXX="g++ -m32"
    #export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
    ./configure --prefix=/usr --libdir=/usr/lib32 \
        --with-pgm --without-documentation
    sed -i 's/python$/&2/' foreign/openpgm/build-staging/openpgm/pgm/{Makefile,version_generator.py}
    make
}

package() {
    cd "$srcdir/$_pkgbasename-$pkgver"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir/usr/include"
}

