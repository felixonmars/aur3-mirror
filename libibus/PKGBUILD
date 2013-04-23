# $Id$
# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Rainy <rainylau(at)gmail(dot)com>
# Contributor: Lee.MaRS <leemars at gmail dot com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Brad Fanella <bradfanella@archlinux.us>

_pkgbase=ibus
pkgname=lib$_pkgbase
pkgver=1.5.2
pkgrel=1
pkgdesc="Library for Next Generation Input Bus for Linux"
arch=('i686' 'x86_64')
url="http://ibus.googlecode.com"
license=('LGPL')
depends=('glib2')
makedepends=('gobject-introspection' 'dconf' 'iso-codes' 'intltool' 'gtk2' 'gtk3')
options=('!libtool')
provides=("$_pkgbase=$pkgver")
conflicts=('ibus')
source=(http://ibus.googlecode.com/files/${_pkgbase}-${pkgver}.tar.gz)
sha1sums=('a7e1695731b4c954fa8897d091e6dda64e08b28c')

build() {
  cd "$srcdir/${_pkgbase}-${pkgver}"
  export PYTHON=python2
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/ibus \
    --sysconfdir=/etc \
    --disable-gconf \
    --enable-dconf \
    --disable-memconf \
    --disable-ui \
    --disable-engine
  make
}

package() {
  cd "$srcdir/${_pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install-pkgconfigDATA
  cd src
  make DESTDIR="${pkgdir}" install
}
