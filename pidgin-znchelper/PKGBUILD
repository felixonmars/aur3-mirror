# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=pidgin-znchelper
pkgver=1.5.0
pkgrel=1
pkgdesc="Pidgin plugin, removing double-timestamps when replaying messages from ZNC"
arch=('i686' 'x86_64')
url="https://launchpad.net/pidgin-znc-helper"
license=('GPL')
depends=('pidgin')
makedepends=('intltool')
source=("https://launchpad.net/pidgin-znc-helper/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz")
md5sums=('93b2972d733854897170b0f6900d4862')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
