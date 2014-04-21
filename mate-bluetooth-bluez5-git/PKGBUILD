# Maintainer : Martin Wimpress <code@flexion.org>

_ver=1.8.0
_pkgname=mate-bluetooth
pkgname=${_pkgname}-bluez5-git
pkgver=1.8.0.20140417.23199a8
pkgrel=1
pkgdesc="A collection of Bluetooth utilities and modules for MATE"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('bluez' 'dbus' 'desktop-file-utils' 'gtk2' 'gvfs' 'libnotify' 'libunique')
makedepends=('git' 'gobject-introspection' 'mate-common' 'caja-sendto' 'yelp-tools')
             #'mate-user-share: Enable sharing via bluetooth and other protocols.'
optdepends=('yelp: for reading MATE help documents')
groups=('mate-unstable-extra')
source=("${pkgname}"::"git+https://github.com/infirit/${_pkgname}.git#branch=bluez5")
sha1sums=('SKIP')
install=${_pkgname}.install

pkgver() {
    cd "${srcdir}/${pkgname}"
    echo ${_ver}.$(date +%Y%m%d).$(git rev-parse --short master)
}

prepare() {
    cd "${srcdir}/${pkgname}"
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "${srcdir}/${pkgname}"
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --enable-introspection \
        --disable-desktop-update \
        --disable-icon-update
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="${pkgdir}" install
}
