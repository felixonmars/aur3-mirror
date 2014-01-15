# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Piotr Gorski <sir_lucjan@bridgelinux.pl>
# Contributor: Xpander <xpander0@gmail.com>

pkgname=mate-file-manager-1.7
_pkgname=caja
pkgver=1.7.1
pkgrel=3
pkgdesc="The MATE shell and file manager"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dbus' 'desktop-file-utils' 'exempi' 'gtk2' 'gvfs' 'libexif' 'libunique'
         'libxt' 'mate-desktop' 'mate-icon-theme' 'startup-notification')
makedepends=('gobject-introspection' 'mate-common' 'pangox-compat')
optdepends=('gstreamer0.10-good-plugins: automatic media playback when mouseover')
replaces=('mate-file-manager')
provides=('mate-file-manager')
conflicts=('mate-file-manager')
options=('!emptydirs')
groups=('mate')
source=("http://pub.mate-desktop.org/releases/1.7/${_pkgname}-${pkgver}.tar.xz")
sha1sums=('3a7a5d90d18b9b5342cebd0474f81d542ee0480b')

install=${pkgname}.install

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgname} \
        --enable-unique \
        --enable-introspection \
        --disable-static \
        --disable-update-mimedb
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}

