# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Christian Theune <ct@gocept.com>
# Contributor: M Rawash <mrawash@gmail.com>

pkgname=gnotime
pkgver=2.4.1
pkgrel=2
pkgdesc="A utility to track time spent on activities"
arch=('i686' 'x86_64')
license=('GPL')
url="http://gttr.sourceforge.net/"
depends=('gtkhtml3' 'guile' 'qof' 'desktop-file-utils' 'libgnomeui' 'libxss')
makedepends=('perlxml' 'gnome-doc-utils')
options=('!libtool' '!emptydirs')
install=gnotime.install
source=(http://downloads.sourceforge.net/gttr/${pkgname}-${pkgver}.tar.gz)
md5sums=('c3a3bb7b144d38829c298532e702474f')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  LIBS="-lm" ./configure --prefix=/usr --sysconfdir=/etc \
  --localstatedir=/var
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${pkgdir} install
  mkdir -p ${pkgdir}/usr/share/gconf/schemas
  gconf-merge-schema ${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas \
    ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
  chmod +x ${pkgdir}/usr/bin/gnotime-remote
}
