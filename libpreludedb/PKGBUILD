# Maintainer: Quentin Panissier <contact@meshup.net>

pkgname=libpreludedb
pkgver=1.2.5
pkgrel=1
pkgdesc='Provides an abstraction layer to store IDMEF alerts of Prelude System'
arch=('i686' 'x86_64')
url='http://www.prelude-ids.org'
license=('GPLv2')
depends=('libprelude' 'mariadb' 'libgcrypt' 'libltdl')
install='libpreludedb.install'
source=("https://www.prelude-ids.org/attachments/download/352/$pkgname-$pkgver.tar.gz")
md5sums=('cfab5697e2d62c0ae67f1ca086299aac')

build() {
    cd "$srcdir"/$pkgname-$pkgver

    export LD_LIBRARY_PATH=/usr/lib

    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
                --without-perl --with-python=/usr/bin/python2

    make
}

package() {
    cd "$srcdir"/$pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
