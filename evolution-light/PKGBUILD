# $Id: PKGBUILD 120599 2011-10-3 20:54:43Z TBastiani $
# Maintainer: Thomas Bastiani <thom@codehawks.eu>

pkgname=evolution-light
originalpkgname=evolution
pkgver=3.2.0
pkgrel=1
pkgdesc="A light version of Evolution without palm pilot, exchange, ldap, nntp and network manager support"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gnome-desktop' 'evolution-data-server' 'gtkhtml4' 'libcanberra' 'gstreamer0.10' 'libpst' 'libytnef'
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('intltool' 'gnome-doc-utils')
optdepends=('bogofilter: possible junk filter plugin'
            'spamassassin: possible junk filter plugin')
#groups=('gnome-extra')
options=('!libtool' '!emptydirs')
provides=('evolution')
conflicts=('evolution')
install=evolution.install
url=http://www.gnome.org/projects/evolution/
source=(http://ftp.gnome.org/pub/gnome/sources/${originalpkgname}/${pkgver%.*}/${originalpkgname}-${pkgver}.tar.xz)
sha256sums=('538883531aa64bec1b43c73db9cf1b59573d10adc4d8dca6401e4bffa90f246d')

build() {
  cd "${srcdir}/${originalpkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var \
      --libexecdir=/usr/lib \
      --disable-scrollkeeper \
      --enable-nss=yes \
      --with-openldap=no \
      --enable-smime=yes \
      --enable-pilot-conduits=no \
      --enable-nntp=no \
      --enable-exchange=no \
      --enable-nm=no \
      --with-krb5=/usr \
      --disable-image-inline
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
  make
  make -C plugins/tnef-attachments
}

package() {
  cd "${srcdir}/${originalpkgname}-${pkgver}"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install
  make -C plugins/tnef-attachments DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${originalpkgname}.schemas" --domain evolution-3.2 ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
