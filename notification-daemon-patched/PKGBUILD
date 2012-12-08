# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Mark Rosenstand <mark@borkware.net>

pkgname=notification-daemon-patched
pkgver=0.7.6
pkgrel=1
pkgdesc="Notification daemon - patched to handle timeout correctly"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.galago-project.org/specs/notification/"
depends=('gtk3' 'libcanberra')
groups=('gnome')
makedepends=('pkgconfig' 'intltool')
options=('!libtool' '!emptydirs')
source=(http://download.gnome.org/sources/notification-daemon/0.7/notification-daemon-${pkgver}.tar.xz
        timeout-fix.patch)
sha256sums=('64d0ce6fb12c94c3b73b701502c804c408cb5a94580bcae5ac37607639f7a0b3'
            'd9896a9249825d7a52142315ba6321a168371bc4c3e921c60b2312abc71c050e')

build() {
    cd notification-daemon-${pkgver}
    ./configure --prefix=/usr --sysconfdir=/etc \
        --libexecdir=/usr/lib/notification-daemon-1.0 \
        --localstatedir=/var --disable-static
        
    patch -p1 -i ../timeout-fix.patch   
    make
}

package() {
    cd notification-daemon-${pkgver}
    make DESTDIR=${pkgdir} install
}
