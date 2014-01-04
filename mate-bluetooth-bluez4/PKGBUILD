# Maintainer : Martin Wimpress <code@flexion.org>

_pkgname=mate-bluetooth
pkgname=${_pkgname}-bluez4
pkgver=1.6.0
pkgrel=6
pkgdesc="A collection of Bluetooth utilities and modules for MATE"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('bluez4' 'dbus-glib' 'desktop-file-utils' 'gtk2' 'gvfs-obexftp-bluez4'
         'libnotify' 'libunique')
makedepends=('gobject-introspection' 'mate-common' 'mate-doc-utils'
             'mate-file-manager-sendto' 'perl-xml-parser')
optdepends=('mate-user-share-bluetooth: Enable sharing via bluetooth and other protocols.')
options=('!emptydirs')
groups=('mate-extra')
conflicts=('mate-bluetooth')
provides=('mate-bluetooth')
replaces=('mate-bluetooth')
source=("http://pub.mate-desktop.org/releases/1.6/${_pkgname}-${pkgver}.tar.xz")
sha1sums=('fc8810f16a1b70bd24dd329b505d932f5b672a56')
install=${_pkgname}.install

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --enable-introspection \
        --disable-scrollkeeper \
        --disable-desktop-update \
        --disable-icon-update
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
