# Maintainer: Joris Steyn <jorissteyn@gmail.com>
pkgname=varnish-vmod-header
pkgver=69.a6c8689
_varnishver=3.0.3
pkgrel=1
pkgdesc="A header-modification vmod for Varnish"
arch=('i686' 'x86_64')
url="https://github.com/varnish/libvmod-header"
license=('FreeBSD')
depends=('varnish')
makedepends=('git' 'varnish' 'python' 'python-docutils')
source=('git://github.com/varnish/libvmod-header.git#commit=a6c8689'
        "http://repo.varnish-cache.org/source/varnish-$_varnishver.tar.gz"
        'fix-makefiles-for-arch.patch')
md5sums=('SKIP'
         '714310c83fdbd2061d897dacd3f63d8b'
         '424867e1fc8025481a4aad347270454f')

pkgver() {
    cd "$srcdir"/libvmod-header
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    cd "$srcdir"/libvmod-header

    # patch build files to support latest autotools
    patch -p1 -i "$srcdir"/fix-makefiles-for-arch.patch

    ./autogen.sh
    ./configure VMODDIR=/usr/lib/varnish/vmods VARNISHSRC=`pwd`/../varnish-$_varnishver --prefix=/usr
    make
}

check() {
    cd "$srcdir"/libvmod-header
    varnishtest -D vmod_topbuild=`pwd` src/tests/*.vtc
}

package() {
    cd "$srcdir"/libvmod-header
    make DESTDIR="$pkgdir/" install
}

