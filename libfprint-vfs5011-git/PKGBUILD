# Maintainer: Michael Goehler <somebody.here@gmx.de>
# Contributor: Nikolay Amiantov <nikoamia@gmail.com>

pkgname=libfprint-vfs5011-git
_pkgname=libfprint
pkgver=r268.9f408bf
pkgrel=1
pkgdesc="libfprint is an open source software library designed to make it easy for application developers to add support for consumer fingerprint readers to their software."
arch=(i686 x86_64)
url="http://www.freedesktop.org/wiki/Software/fprint/libfprint/"
license=(LGPL)
depends=(libusb nss gdk-pixbuf2)
makedepends=(git libtool)
provides=(libfprint)
conflicts=(libfprint)
options=(!libtool !emptydirs)
install=libfprint-vfs5011-git.install
source=('libfprint::git+git://anongit.freedesktop.org/libfprint/libfprint')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"

    NOCONFIGURE="yes" ./autogen.sh

    ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --disable-static \
                --disable-examples-build \
                --disable-x11-examples-build \
                --enable-udev-rules \
                --with-drivers=vfs5011 \
                --disable-debug-log

    make
}

package() {
    cd "${srcdir}/${_pkgname}"

    make DESTDIR="${pkgdir}" install
}

# vim:set ts=4 sw=4 et:
