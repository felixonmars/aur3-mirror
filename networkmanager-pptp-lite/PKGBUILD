# Maintainer: Westminboy <westminboy@gmail.com>

pkgname=networkmanager-pptp-lite
_pkgname=networkmanager-pptp
pkgver=0.9.6.0
pkgrel=1
pkgdesc="NetworkManager VPN plugin for pptp "
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/NetworkManager/"
depends=("networkmanager>=${pkgver}" 'pptpclient' 'gtk2' 'libgnome-keyring')
makedepends=('intltool')
optdepends=('network-manager-applet: GNOME frontends to NetWorkmanager')
options=('!libtool')
provides=($_pkgname)
conflicts=($_pkgname)
install=networkmanager-pptp.install
source=(http://ftp.gnome.org/pub/GNOME/sources/NetworkManager-pptp/0.9/NetworkManager-pptp-${pkgver}.tar.xz)
sha256sums=('a84cbbf24827229e3dd3611bbde191398275c3b7ecd03913047197644f27a2b4')

build() {
  cd NetworkManager-pptp-${pkgver}
  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --libexecdir=/usr/lib/networkmanager \
      --with-gtkver=2 \
      --disable-maintainer-mode \
      --disable-static \
      --enable-more-warnings=no
  make
}

package() {
  cd NetworkManager-pptp-${pkgver}
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install
}
