# Contributor: Aguilera Dario <dario_21_06@hotmail.com>

pkgname=nautilus-undo-redo
_realname=nautilus
pkgver=2.28.4
pkgrel=1
pkgdesc="El navegador de archivos de Gnome con la funcion deshacer/rehacer"
arch=(i686 x86_64)
license=('GPL')
depends=('libbeagle>=0.3.9' 'libtracker>=0.6.95' 'libexif>=0.6.19' 'exempi>=2.1.1' 'gnome-icon-theme>=2.28.0' 'desktop-file-utils' 'gvfs>=1.4.2' 'libunique>=1.1.6' 'gnome-desktop>=2.28.1')
makedepends=('pkgconfig' 'intltool')
replaces=('gnome-volume-manager' 'nautilus')
url="http://www.gnome.org"
groups=('gnome')
conflicts=('nautilus')
provides=('nautilus')
options=('!libtool' '!emptydirs')
install=nautilus.install
source=(http://ftp.gnome.org/pub/gnome/sources/${_realname}/2.28/${_realname}-${pkgver}.tar.bz2
        undo-redo2.diff
        nautilus-condrestart.patch)
sha256sums=('3aceda1c36acda20a0f9ce75165a31b1285a7aca2097d0583e340ccb2b01ea87'
            '34be797948217c08ac39f052258b36217c7e1ae2d19d8f7dadb2a731d368f822'
            'a8f3a37effe64560d79b3436a181883dd9144d28a71f0e5624bfd35b7e70284f')

build() {
  cd "${srcdir}"
  patch -p0 -i undo-redo2.diff || return 1
  patch -p0 -i nautilus-condrestart.patch || return 1
  cd ${_realname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-static --libexecdir=/usr/lib/nautilus --disable-update-mimedb || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install || return 1
  
  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${_realname}.schemas" --domain nautilus ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
