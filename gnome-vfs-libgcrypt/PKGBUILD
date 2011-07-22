# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Patrick Melo <patrick@patrickmelo.eti.br>

pkgname=gnome-vfs-libgcrypt
_pkgname=gnome-vfs
pkgver=2.24.4
pkgrel=1
pkgdesc="The GNOME Virtual File System (with libGCrypt 1.5 patch)"
arch=(i686 x86_64)
license=('LGPL')
depends=('fam' 'gconf' 'bzip2' 'avahi' 'smbclient' 'gnome-mime-data' 'krb5' 'gnutls' 'libgcrypt>=1.5.0')
makedepends=('pkgconfig' 'intltool' 'gtk-doc' 'gnome-common')
provides=('gnome-vfs=2.24.4')
conflicts=('gnome-vfs')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org"
install=gnome-vfs.install
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/2.24/gnome-vfs-${pkgver}.tar.bz2
        gnutls-config.patch
        gcrypt-config.patch)
sha256sums=('62de64b5b804eb04104ff98fcd6a8b7276d510a49fbd9c0feb568f8996444faa'
            '66c7cfb12995c0dd94a2caea95c7e3c55981993f05a79c585d60915ff131955d'
            'c059e218f310da683778919d36e7862f7e763384805f6453d328fbaf507a8114')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  #Fix build with new gnutls
  patch -Np1 -i "${srcdir}/gnutls-config.patch"
  #Fix build with new libgcrypt
  patch -Np1 -i "${srcdir}/gcrypt-config.patch"
  libtoolize --force
  gtkdocize
  aclocal
  autoconf
  automake
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/gnome-vfs-2.0 \
      --enable-samba --disable-hal \
      --enable-avahi --disable-howl \
      --disable-openssl --enable-gnutls
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  install -d -m755 "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${_pkgname}.schemas" --domain gnome-vfs-2.0 ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
