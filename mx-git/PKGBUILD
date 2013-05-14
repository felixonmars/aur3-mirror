
# Maintainer: kens <arch forums>
pkgname=mx-git
pkgver=1.99.4_266_ga614f77
pkgrel=3
pkgdesc="A Clutter-based toolkit"
arch=('any')
url="https://github.com/clutter-project/mx"
license=('LGPL')
depends=('clutter')
makedepends=('git' 'libtool' 'intltool')
provides=('mx')
source=('git://github.com/clutter-project/mx.git')
md5sums=('SKIP')

pkgver() {
    cd mx
    git describe --always | sed 's#-#_#g;s#v##'
}

build() {
    cd ${srcdir}/mx
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd ${srcdir}/mx
    make DESTDIR="$pkgdir/" install
}
