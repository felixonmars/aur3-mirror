# Maintainer: Joris Steyn <jorissteyn@gmail.com>
#
# Todo:
# * include systemd config

pkgname=varnish-agent
pkgver=2.1
_varnishver=3.0.3
pkgrel=1
pkgdesc="A small daemon for remote control and monitoring of Varnish"
arch=('i686' 'x86_64')
url="https://github.com/varnish/vagent2/"
license=('FreeBSD')
depends=('varnish' 'libmicrohttpd')
makedepends=('git' 'varnish' 'python' 'python-docutils' 'perl-libwww')
source=("git://github.com/varnish/vagent2.git#tag=$pkgver"
        "http://repo.varnish-cache.org/source/varnish-$_varnishver.tar.gz"
        'fix-makefiles-for-arch.patch')
md5sums=('SKIP'
         '714310c83fdbd2061d897dacd3f63d8b'
         'b3bafdfd965d409e6cbc3a14de14ca1e')

pkgver() {
    cd "$srcdir"/vagent2
    git describe --always | sed 's|-|.|g'
}

build() {
    cd "$srcdir"/vagent2

    # patch build files to support latest autotools
    patch -p1 -i "$srcdir"/fix-makefiles-for-arch.patch

    ./autogen.sh
    ./configure VARNISHSRC=`pwd`/../varnish-$_varnishver --prefix=/usr
    make
}

check() {
    cd "$srcdir"/vagent2/tests
    PATH+=:/usr/bin/vendor_perl

    # allow failures (some tests need root privileges)
    make check || true
}

package() {
    cd "$srcdir"/vagent2
    make DESTDIR="$pkgdir/" install
}

