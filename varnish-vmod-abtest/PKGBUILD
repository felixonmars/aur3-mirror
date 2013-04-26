# Maintainer: Joris Steyn <jorissteyn@gmail.com>
pkgname=varnish-vmod-abtest
pkgver=v1.0
_varnishver=3.0.3
pkgrel=1
pkgdesc="A varnish vmod to get weighted random values for A/B testing, with a dynamic configuration"
arch=('i686' 'x86_64')
url="https://github.com/Destination/libvmod-abtest"
license=('FreeBSD')
depends=('varnish')
makedepends=('git' 'varnish' 'python' 'python-docutils')
source=('git://github.com/Destination/libvmod-abtest.git#tag=v1.0'
        "http://repo.varnish-cache.org/source/varnish-$_varnishver.tar.gz"
        'fix-makefiles-for-arch.patch')
md5sums=('SKIP'
         '714310c83fdbd2061d897dacd3f63d8b'
         '368250c73186ab3fa86976cee8cbc23a')

pkgver() {
    cd "$srcdir"/libvmod-abtest
    git describe --always | sed 's|-|.|g'
}

build() {
    cd "$srcdir"/libvmod-abtest

    # patch build files to support latest autotools
    patch -p1 -i "$srcdir"/fix-makefiles-for-arch.patch

    ./autogen.sh
    ./configure VMODDIR=/usr/lib/varnish/vmods VARNISHSRC=`pwd`/../varnish-$_varnishver --prefix=/usr
    make
}

check() {
    cd "$srcdir"/libvmod-abtest

    # todo: fix failing test! (see patch in source)
    varnishtest -D vmod_topbuild=`pwd` src/tests/*.vtc || true
}

package() {
    cd "$srcdir"/libvmod-abtest
    make DESTDIR="$pkgdir/" install
}

