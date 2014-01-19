# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Giovanni Ricciardi <kar98k.sniper@gmail.com>
# Contributor: Xpander <xpander0@gmail.com>
# Contributor: Piotr Gorski <sir_lucjan@openlinux.pl>

pkgname=mate-notification-daemon-1.7
_pkgname=mate-notification-daemon
pkgver=1.7.1
pkgrel=1
pkgdesc="Notification daemon for MATE"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('dconf' 'dbus-glib' 'gtk2' 'libcanberra' 'libwnck' 'libnotify')
makedepends=('mate-common' 'perl-xml-parser')
options=('!emptydirs')
groups=('mate')
provides=('mate-notification-daemon')
replaces=(mate-notification-daemon)
conflicts=(mate-notification-daemon)
source=("http://pub.mate-desktop.org/releases/1.7/${_pkgname}-${pkgver}.tar.xz")
sha1sums=('9db55c4b1ce53a461f74ab77bffe023484354d8b')
install=${_pkgname}.install

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgname} \
        --disable-static
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}