# $Id: PKGBUILD 74343 2010-03-30 20:02:59Z ibiru $
# Maintainer: W. Kyle <kyle_white@hotmail.com>

pkgname=vino-avahi
pkgver=2.28.2
pkgrel=1
pkgdesc="a VNC server for the GNOME desktop, with avahi (bonjour/mdns) broadcasting enabled"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libnotify>=0.4.5' 'libxtst' 'libunique>=1.1.2' 'libsm' 'gconf>=2.28.1' 'libsoup>=2.30.0' 'telepathy-glib>=0.10.1' 'gtk2>=2.20')
makedepends=('pkgconfig' 'intltool' 'networkmanager' 'libgnome-keyring>=2.29.4')
conflicts=('vino')
url="http://www.gnome.org"
options=(!emptydirs)
install=vino-avahi.install
source=(http://ftp.gnome.org/pub/gnome/sources/vino/2.28/vino-${pkgver}.tar.bz2)
sha256sums=('f2a0b7c77fe58f3918b202a9f0f4ae3295518ac43eeceade0875b096038a72e0')

build() {
  cd "${srcdir}/vino-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/vino --enable-avahi \
      --localstatedir=/var || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install || return 1
  
  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/vino.schemas" --domain vino ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
