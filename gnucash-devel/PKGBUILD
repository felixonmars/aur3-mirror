# Maintainer: Moritz Lipp <mlq@pwmt.org>
pkgname=gnucash-devel
_pkgname=gnucash
pkgver=2.5.10
pkgrel=1
pkgdesc="A personal and small-business financial-accounting application"
arch=('i686' 'x86_64')
url="http://www.gnucash.org"
license=("GPL")
groups=()
depends=('gconf>=2.22' 'glib2>=2.26' 'gtk2>=2.24' 'guile>=2.0.0' 'libart-lgpl'
'goffice0.8' 'libgsf' 'libxml2>=2.5.10' 'pango' 'swig>=2.0.10' 'webkitgtk>=1.0'
'libofx' 'aqbanking>4.0.0' 'sqlite2' 'libdbi-drivers' 'libgnomecanvas')
makedepends=('intltool')
provides=('gnucash')
conflicts=('gnucash')
options=('!libtool' '!makeflags' '!emptydirs')
install=${pkgname}.install
source=(http://downloads.sourceforge.net/sourceforge/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
md5sums=('9b886eab9dc9340b086a45ed5e4907c4')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure \
    --disable-error-on-warning \
    --disable--schemas-install \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --enable-ofx \
    --enable-aqbanking
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  cd src/doc/design
  make DESTDIR="${pkgdir}" install-info

  install -dm755 "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain gnucash "${pkgdir}"/etc/gconf/schemas/*.schemas
  rm -f "${pkgdir}"/etc/gconf/schemas/*.schemas

  # remove valgrind tool
  rm "${pkgdir}"/usr/bin/gnucash-valgrind
}

# vim:set ts=2 sw=2 et:
