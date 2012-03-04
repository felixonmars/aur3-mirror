# $Id: $
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Aaron, phrakture, Griffin <aaron@archlinux.org>
# Contributor: erkaN kaplaN <erkan@linux-sevenler.org>
# Maintainer: Alexsandr Pavlov <kidoz at mail dot ru>

pkgname=gwget
pkgver=1.0.4
pkgrel=3
pkgdesc="Gwget is a download manager for the Gnome Desktop."
arch=('i686' 'x86_64')
url="http://gnome.org/projects/gwget/index.html"
license=('GPL')
depends=('libgnomeui' 'libnotify')
makedepends=('perlxml' 'gnome-doc-utils' 'intltool')
options=('!libtool' '!emptydirs')
install=gwget.install
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/1.0/${pkgname}-${pkgver}.tar.bz2
        libnotify-0.7.patch)
md5sums=('b65ebc752cad068e747ae6ef45fafdcc'
         '0a82f8650a9fecda5a80abbc6ae18312')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  patch -Np0 -i ../libnotify-0.7.patch
  
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${pkgdir} install
  install -dm755 ${pkgdir}/usr/share/gconf/schemas
  gconf-merge-schema ${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
