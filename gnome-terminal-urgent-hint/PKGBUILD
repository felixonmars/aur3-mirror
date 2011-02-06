# Contributor: Martin Häger <martin.haeger@gmail.com>
pkgname=gnome-terminal-urgent-hint
pkgver=2.26.3.1
pkgrel=1
pkgdesc="The GNOME Terminal Emulator with patches for optional urgent hint (flashing taskbar entry) on terminal bell."
arch=(i686 x86_64)
license=('GPL')
depends=('gconf>=2.26.0-2' 'vte>=0.20.5' 'startup-notification>=0.10')
makedepends=('pkgconfig' 'gnome-doc-utils>=0.16.0' 'intltool') 
conflicts=('gnome-terminal')
provides=("gnome-terminal=$pkgver")
options=('!emptydirs')
url="http://www.gnome.org"
install=gnome-terminal.install
source=(http://ftp.gnome.org/pub/gnome/sources/gnome-terminal/2.26/gnome-terminal-$pkgver.tar.bz2
	terminal-dontping.patch
	urgent-hint-on-bell.patch)
md5sums=('b6c6c0f5f3e061da7e56f3a04385bb7b'
         '9ae26f8e6a9f0401889e8a0ba7e831d6'
         'ea254488bee90777d9baef0599cb120e')

build() {
  cd "${srcdir}/gnome-terminal-${pkgver}"
  patch -Np0 -i "${srcdir}/terminal-dontping.patch" || return 1
  patch -Np0 -i "${srcdir}/urgent-hint-on-bell.patch" || return 1
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-scrollkeeper || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install || return 1
  
  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/gnome-terminal.schemas" --domain gnome-terminal ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}

# vim:set ts=2 sw=2 et:
