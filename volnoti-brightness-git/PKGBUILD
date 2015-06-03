# Maintainer: gabrielsimoes <simoes.sgabriel@gmail.com>
# Contibutor: David Brazdil <db538@cam.ac.uk>

pkgname=volnoti-brightness-git
pkgver=0.1
pkgrel=3
pkgdesc="Lightweight volume and brightness notification for Linux using volnoti"
url="https://github.com/hcchu/volnoti"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('dbus-core' 'dbus-glib' 'gtk2' 'gdk-pixbuf2' 'librsvg')
makedeps=('git' 'pkg-config')
conflicts=('volnoti')
replaces=('volnoti')
provides=('volnoti')
source=("https://github.com/hcchu/volnoti/archive/${pkgver}.tar.gz")
md5sums=('5c2812345765047eaa3810d51dbb28a7')

build() {
    cd "${srcdir}/volnoti-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/volnoti-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/volnoti/COPYING"
}