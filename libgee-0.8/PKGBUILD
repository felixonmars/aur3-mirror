# $Id: PKGBUILD 108155 2011-01-30 12:17:51Z ibiru $
# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=libgee-0.8
pkgver=0.7.2
pkgrel=1
pkgdesc="GObject collection library"
url="http://live.gnome.org/Libgee"
license=('LGPL2.1')
arch=('i686' 'x86_64')
depends=('glib2>=2.28')
makedepends=('gobject-introspection')
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/libgee/0.7/libgee-${pkgver}.tar.xz)
sha256sums=('1aee29104a4f5f661243ee5ca2e35a582dc7ff06bc3bd3fed9bf83e26af1b59c')

build() {
    cd "${srcdir}/libgee-${pkgver}"
    ./configure --prefix=/usr --disable-static
    make
    make DESTDIR="${pkgdir}" install
}
