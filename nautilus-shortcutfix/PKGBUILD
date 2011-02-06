# $Id: PKGBUILD 78718 2010-04-27 20:50:07Z jgc $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=nautilus-shortcutfix
pkgver=2.30.1
pkgrel=1
pkgdesc="The GNOME shell and file manager. A quickfix has been applied to fix the unreliability of the keyboard shortcuts"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libexif>=0.6.19' 'exempi>=2.1.1' 'gnome-icon-theme>=2.30.2' 'desktop-file-utils' 'gvfs>=1.6.1' 'libunique>=1.1.6' 'gnome-desktop>=2.30.0')
makedepends=('pkgconfig' 'intltool')
replaces=('gnome-volume-manager')
conflicts=('nautilus')
url="http://www.gnome.org"
groups=('gnome')
options=('!libtool' '!emptydirs')
install=nautilus.install
source=(http://ftp.gnome.org/pub/gnome/sources/nautilus/2.30/nautilus-${pkgver}.tar.bz2
        nautilus-condrestart.patch
        nautilus-shortcutfix.patch)
sha256sums=('83df19591c4d0d359fe67d16b3f73f71e6a2aa5ba7d477739276c7562f221144'
            'f825292ef26274d3044272ca9f25095391cc49d30fb0056e7ed7346a1b4d106c'
            '9679ea06fd891a375fcf2a2679405707f1f3c7ede6e387a431c798f71c566143')

build() {
  cd "${srcdir}/nautilus-${pkgver}"
  patch -Np1 -i "${srcdir}/nautilus-condrestart.patch" || return 1
  patch -Np1 -i "${srcdir}/nautilus-shortcutfix.patch" || return 1
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/nautilus \
      --disable-update-mimedb || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install || return 1

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/nautilus.schemas" --domain nautilus ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
