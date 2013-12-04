# $Id$
# Original Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Original Contributor: tobias <tobias funnychar archlinux.org>
# Maintainer: Fabrizio Narni <shibotto@gmail.com>

pkgname=xfce4-panel-calendar
_pkgname=xfce4-panel
pkgver=4.10.1
pkgrel=1
_ubunturel=1ubuntu1
pkgdesc="Panel for the Xfce desktop environment with calendar popup to clock plugin from Xubuntu"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('exo' 'garcon' 'libxfce4ui' 'libwnck' 'hicolor-icon-theme'
         'desktop-file-utils')
makedepends=('intltool' 'gtk-doc')
provides=("xfce4-panel=${pkgver}")
conflicts=('xfce4-panel')
install=${_pkgname}.install
source=(http://archive.xfce.org/src/xfce/${_pkgname}/4.10/${_pkgname}-${pkgver}.tar.bz2
        http://archive.ubuntu.com/ubuntu/pool/universe/x/${_pkgname}/${_pkgname}_${pkgver}-${_ubunturel}.debian.tar.gz)
sha256sums=('573052ed1b65e247415f92df120c8a78f9e4152c2636d38c923f82e32b8475d6'
            'bb2217ed55d061efca85d3ad0f98eed44f0583de7311c12404f5ea0c2d32a851')

prepare() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  patch -p1 -i ${srcdir}/debian/patches/xubuntu_add-calendar-popup-to-clock-plugin.patch
}

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-gio-unix \
    --enable-gtk-doc \
    --disable-debug
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
