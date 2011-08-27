# $Id: PKGBUILD 24494 2009-01-17 20:42:01Z jgc $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=twitter-glib
pkgver=0.9.6
pkgrel=1
pkgdesc="A GObject-based C wrapper library around the (almost-) RESTful web API provided by Twitter"
arch=(i686 x86_64)
license=('LGPL')
depends=('glib2>=2.18.4' 'gnutls>=2.6.3' 'libxml2>=2.7.2' 'libproxy' 'json-glib')
makedepends=('intltool' 'pkgconfig')
url="http://www.gnome.org"
source=(http://www.gnome.org/~ebassi/source/${pkgname}-${pkgver}.tar.gz)
options=('!libtool' '!emptydirs')
md5sums=('3daf46de5bfab1ed45f19eaedeb0b19e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
