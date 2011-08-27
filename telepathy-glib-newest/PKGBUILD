# Maintainer:  Adam Hani Schakaki <krzd@krzd.net>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Kessia 'even' Pinheiro <kessiapinheiro at gmail.com>
# Contributor: Bjorn Lindeijer <bjorn lindeijer nl>
# Contributor: Flamelab <panosfilip@gmail.com>

pkgname=telepathy-glib-newest
_realpkgname=telepathy-glib
pkgver=0.15.4
pkgrel=1
pkgdesc="GLib bindings for the Telepathy D-Bus protocol"
arch=('i686' 'x86_64')
url="http://telepathy.freedesktop.org"
groups=('telepathy')
license=('LGPL2.1')
options=('!libtool' '!emptydirs')
provides=("telepathy-glib=${pkgver}")
conflicts=("telepathy-glib")
depends=('dbus-glib')
makedepends=('libxslt' 'vala' 'gobject-introspection')
source=("http://telepathy.freedesktop.org/releases/${_realpkgname}/${_realpkgname}-${pkgver}.tar.gz")

build() {
    cd "${srcdir}/${_realpkgname}-${pkgver}"
    PYTHON=/usr/bin/python2 ./configure --prefix=/usr \
        --libexecdir=/usr/lib/telepathy \
        --enable-vala-bindings \
        --enable-static=no
    make
}

package() {
    cd "${srcdir}/${_realpkgname}-${pkgver}"
    make DESTDIR=${pkgdir} install
}
md5sums=('87521a782de115f938787dc17fe158e1')
