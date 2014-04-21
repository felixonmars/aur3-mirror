pkgname=telepathy-mission-control-slim
_pkgname=telepathy-mission-control
pkgver=5.16.1
pkgrel=1
pkgdesc="A Telepathy component providing abstraction of some of the details of connection managers. With no GNOME and NM/ConnMan dependecies."
arch=('i686' 'x86_64')
url="http://telepathy.freedesktop.org/wiki/Mission Control"
license=('LGPL2.1')
depends=('telepathy-glib')
makedepends=('libxslt' 'python2')
conflicts=('telepathy-mission-control')
provides=('telepathy-mission-control')
install=$pkgname.install
source=(http://telepathy.freedesktop.org/releases/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('421115a35b9e427807326877f86e7f43')

build() {
    cd "$_pkgname-$pkgver"
    PYTHON=python2 ./configure --prefix=/usr --libexecdir=/usr/lib/telepathy \
        --with-connectivity=no \
        --disable-upower \
        --disable-static \
        --disable-schemas-compile \
        --disable-gnome-keyring
    make
}

package() {
    cd "$_pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
