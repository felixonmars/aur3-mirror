# Maintainer: Joris Steyn <jorissteyn@gmail.com>
pkgname=varnish-vmod-3scale
pkgver=0.9.0
_varnishver=3.0.4
pkgrel=1
pkgdesc="3scale vmod for Varnish"
arch=('i686' 'x86_64')
url="https://github.com/3scale/libvmod-3scale"
license=('custom')
depends=('varnish')
makedepends=('varnish' 'libtool' 'pcre')
source=('https://github.com/3scale/libvmod-3scale/archive/v0.9.0.zip'
        "http://repo.varnish-cache.org/source/varnish-$_varnishver.tar.gz"
        'fix-makefiles-for-arch.patch')
md5sums=('ea36ad1d2038a0c6a7e2580865c83e09'
         'a130ce9c3504b9603a46542635e18701'
         '718e0f55a8e87caeef39d8f08165b79b')
build() {
    cd "$srcdir"/libvmod-3scale-0.9.0

    # patch build files to support latest autotools
    patch -p1 -i "$srcdir"/fix-makefiles-for-arch.patch

    ./autogen.sh
    ./configure VMODDIR=/usr/lib/varnish/vmods VARNISHSRC=`pwd`/../varnish-$_varnishver --prefix=/usr
    make
}

check() {
    cd "$srcdir"/libvmod-3scale-0.9.0

    varnishtest -D vmod_topbuild=`pwd` src/tests/*.vtc
}

package() {
    cd "$srcdir"/libvmod-3scale-0.9.0

    make DESTDIR="$pkgdir/" install
}

