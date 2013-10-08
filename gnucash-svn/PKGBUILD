# Maintainer: Moritz Lipp <mlq@pwmt.org>
pkgname=gnucash-svn
_svnname=gnucash
pkgver=23128
pkgrel=2
pkgdesc="A personal and small-business financial-accounting application"
arch=('i686' 'x86_64')
url="http://www.gnucash.org"
license=("GPL")
groups=()
depends=('gconf>=2.22' 'glib2>=2.20' 'gtk2>=2.16' 'guile' 'libart-lgpl'
'goffice0.8' 'libgsf' 'libxml2>=2.5.10' 'pango' 'swig' 'webkitgtk>=1.0'
'libofx' 'aqbanking>4.0.0' 'sqlite2' 'libdbi-drivers' 'libgnomecanvas')
makedepends=('subversion' 'intltool')
provides=('gnucash')
conflicts=('gnucash')
options=('!libtool' '!makeflags' '!emptydirs')
install=${pkgname}.install
source=("${_svnname}::svn+http://svn.gnucash.org/repo/gnucash/trunk")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_svnname}"
  svnversion | tr -d [A-z]
}

build() {
  cd "${srcdir}/${_svnname}"
  ./autogen.sh
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
  cd "${srcdir}/${_svnname}"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  cd src/doc/design
  make DESTDIR="${pkgdir}" install-info

  install -dm755 "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain gnucash "${pkgdir}"/etc/gconf/schemas/*.schemas
  rm -f "${pkgdir}"/etc/gconf/schemas/*.schemas
}

# vim:set ts=2 sw=2 et:
