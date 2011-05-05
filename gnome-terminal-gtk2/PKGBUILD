# $Id: PKGBUILD 121328 2011-04-30 15:31:28Z ibiru $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-terminal-gtk2
tarname=gnome-terminal
pkgver=3.0.1
pkgrel=2
pkgdesc="The GNOME Terminal Emulator (using GTK2)"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gconf' 'vte' 'gsettings-desktop-schemas' 'libsm')
makedepends=('gnome-doc-utils' 'gtk2' 'intltool')
#gtk2 is needed for gtk-builder-convert
#https://bugzilla.gnome.org/show_bug.cgi?id=588945
#https://bugzilla.gnome.org/show_bug.cgi?id=588732
options=('!emptydirs')
conflicts=('gnome-terminal')
provides=('gnome-terminal')
url="http://www.gnome.org"
groups=('gnome')
install=gnome-terminal.install
source=(http://ftp.gnome.org/pub/gnome/sources/${tarname}/3.0/${tarname}-${pkgver}.tar.bz2
        exitcode.patch)
sha256sums=('388eda40663566cb785e2d92180e0b584c2c89acc3e7bcd30605601710fddc48'
            '263030e9905329d8e651421b575a80c37e30733373378896c94d2c6d6e0ee056')

build() {
  cd "${srcdir}/${tarname}-${pkgver}"
  patch -Np1 -i "${srcdir}/exitcode.patch"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-scrollkeeper \
      --with-gtk=2.0
  make
}

package() {
  cd "${srcdir}/${tarname}-${pkgver}"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${tarname}.schemas" --domain gnome-terminal ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
