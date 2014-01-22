# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Piotr Gorski <sir_lucjan@openlinux.pl>

pkgname=mate-power-manager-1.7
_pkgname=mate-power-manager
pkgver=1.7.0
pkgrel=1
pkgdesc="Session daemon that makes it easy to manage your laptop or desktop system for Mate Desktop"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dbus-glib' 'dconf' 'libcanberra' 'libgnome-keyring' 'libnotify'
         'libunique' 'upower')
makedepends=('docbook2x' 'docbook-xml' 'mate-common' 'perl-xml-parser'
             'xmlto' 'yelp-tools')
optdepends=('mate-panel: Set brightness and inhibit power management from the panel'
            'yelp: for reading MATE help documents')
conflicts=(mate-power-manager)
replaces=(mate-power-manager)
provides=(mate-power-manager)
options=('!emptydirs')
groups=('mate-extra')
source=("http://pub.mate-desktop.org/releases/1.7/${_pkgname}-${pkgver}.tar.xz")
sha1sums=('570afc23e921ca084d3a1f6c2e2abeb4c4403d41')
install=${_pkgname}.install

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./autogen.sh \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgname} \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --sbindir=/usr/bin \
        --enable-applets \
        --enable-unique
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}

