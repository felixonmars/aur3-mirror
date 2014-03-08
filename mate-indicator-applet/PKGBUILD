# Maintainer : Martin Wimpress <code@flexion.org>

pkgname=mate-indicator-applet
pkgver=1.8.0
pkgrel=1
pkgdesc="Indicator Applet for MATE"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dbus' 'gtk2' 'libindicator' 'mate-panel')
makedepends=('mate-common' 'perl-xml-parser' 'yelp-tools')
options=('!emptydirs')
source=("http://pub.mate-desktop.org/releases/1.8/${pkgname}-${pkgver}.tar.xz")
sha1sums=('d4db6dc9054d1489333bbba5a9b397a322f1c855')
install=${pkgname}.install

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexec=/usr/lib/${pkgname} \
        --disable-static
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
