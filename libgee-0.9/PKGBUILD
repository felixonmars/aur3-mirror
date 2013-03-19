# $Id: PKGBUILD 108155 2011-01-30 12:17:51Z ibiru $
# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Zylex <zylex.stk@gmail.com>

pkgname=libgee-0.9
pkgver=0.9.92
pkgrel=1
pkgdesc="GObject collection library"
url="http://live.gnome.org/Libgee"
license=('LGPL2.1')
arch=('i686' 'x86_64')
depends=('glib2>=2.28')
makedepends=('gobject-introspection')
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/libgee/0.9/libgee-${pkgver}.tar.xz)
sha256sums=('94deb5c0d5ca34230345ea8c183ce5a8155121f9c939c4190fe6fe7f9218b642')

build() {
    cd "${srcdir}/libgee-${pkgver}"
    ./configure --prefix=/usr --disable-static
    make
    make DESTDIR="${pkgdir}" install
}
