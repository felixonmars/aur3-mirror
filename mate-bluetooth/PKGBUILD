# Maintainer : Martin Wimpress <code@flexion.org>

pkgname=mate-bluetooth
pkgver=1.6.1
pkgrel=1
pkgdesc="A collection of Bluetooth utilities and modules for MATE"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('bluez4' 'dbus-glib' 'desktop-file-utils' 'gtk2' 'gvfs-obexftp-bluez4'
         'libnotify' 'libunique')
makedepends=('gobject-introspection' 'mate-common' 'mate-doc-utils'
             'mate-file-manager-sendto' 'perl-xml-parser')
optdepends=('mate-user-share-bluez4: Enable sharing via bluetooth and other protocols.')
options=('!emptydirs')
groups=('mate-extra')
source=("http://pub.mate-desktop.org/releases/1.6/${pkgname}-${pkgver}.tar.xz")
sha1sums=('50651af42a031858fe16787a01ee8ecc1eb6971e')
install=${pkgname}.install

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure \
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
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
