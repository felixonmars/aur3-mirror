# Maintainer: Ng Oon-Ee <ngoonee.talk@gmail.com>

pkgname=evolution-plugins-experimental
_pkgname=evolution
pkgver=3.4.4
pkgrel=1
pkgdesc="Additional experimental (unmaintained) plugins for Gnome Evolution - external-editor"
arch=('i686' 'x86_64')
license=('GPL')
depends=("evolution=$pkgver")
makedepends=('gnome-doc-utils' 'intltool') 
options=('!libtool' '!emptydirs')
url=http://www.gnome.org/projects/evolution/
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/${pkgver:0:3}/${_pkgname}-${pkgver}.tar.xz)
sha256sums=('7e541d0894c1d48b89820b6466edafe40215f8cdb45b1c0e9635cc15f49ecb9a')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var \
      --libexecdir=/usr/lib \
      --disable-scrollkeeper \
      --enable-nss=yes \
      --with-openldap=yes \
      --enable-smime=yes \
      --with-krb5=/usr \
      --disable-image-inline
  
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
  make
  cd ${srcdir}/${_pkgname}-${pkgver}/plugins/external-editor
  make
  make DESTDIR="${pkgdir}" install
}
