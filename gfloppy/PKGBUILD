# Maintainer: fs4000 <matthias_dienstbier[at]yahoo[dot]de>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gfloppy
pkgver=2.26.0
pkgrel=1
pkgdesc="floppy formatter for GNOME"
arch=(i686 x86_64)
license=('GPL')
depends=('gconf' 'libglade')
makedepends=('pkgconfig' 'intltool')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org"
install=gfloppy.install
source=(http://ftp.gnome.org/pub/gnome/sources/gnome-utils/2.26/gnome-utils-${pkgver}.tar.bz2)
md5sums=('667400cfb9bee954028024ac3cf91a09')

build() {
  cd "${srcdir}/gnome-utils-${pkgver}"
  sed -i 's/GETTEXT_PACKAGE=gnome-utils-2.0/GETTEXT_PACKAGE=gfloppy/' configure
  ./configure --prefix=/usr \
	--libexecdir=/usr/lib/gnome-utils \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static \
	--disable-hal \
	--disable-schemas-install \
	--disable-scrollkeeper \
	--with-gconf-schema-file-dir=/usr/share/gconf/schemas
  local i
  cd ${pkgname}
  make
  cd ../po
  local i
  for i in *.po
  do
    msggrep -N ../gfloppy/\* -N ../gfloppy/src/\* -o $i $i
  done
  make
}

package() {
  local i
  for i in "${srcdir}/gnome-utils-${pkgver}/"{${pkgname},po}
  do
    cd "$i"
    make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install
  done
}
