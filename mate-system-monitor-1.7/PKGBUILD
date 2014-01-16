# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Giovanni Ricciardi <kar98k.sniper@gmail.com>
# Contributor: Piotr Gorski <sir_lucjan@openlinux.pl>

pkgname=mate-system-monitor-1.7
_pkgname=mate-system-monitor
pkgver=1.7.0
pkgrel=2
pkgdesc="A system monitor for MATE"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dconf' 'dbus' 'glibmm' 'gtk2' 'gtkmm' 'libgtop' 'libwnck' 'librsvg'
         'mate-icon-theme')
makedepends=('docbook2x' 'mate-common' 'perl-xml-parser' 'yelp-tools')
optdepends=('yelp: for reading MATE help documents')
options=('!emptydirs')
groups=('mate-extra')
source=("http://pub.mate-desktop.org/releases/1.7/${_pkgname}-${pkgver}.tar.xz")
sha1sums=('b2af86193f222726927de822781a5e1b20991c20')
install=${_pkgname}.install

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgname} \
        --localstatedir=/var \
        --disable-static \
        --disable-scrollkeeper
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}