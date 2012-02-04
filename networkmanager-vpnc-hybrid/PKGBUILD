# $Id: PKGBUILD 122481 2011-05-04 09:16:50Z ibiru $
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Hybrid additions: Reza Jelveh <reza.jelveh at tuhh.de>
# based on https://code.launchpad.net/~mathieu-tl/network-manager/vpnc+hybrid

pkgname=networkmanager-vpnc-hybrid
pkgver=0.8.999
pkgrel=1
pkgdesc="NetworkManager VPN plugin for vpnc+hybrid"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/NetworkManager/"
depends=("networkmanager>=${pkgver}" 'vpnc' 'hicolor-icon-theme'
         'gtk3' 'libgnome-keyring')
makedepends=('intltool')
optdepends=('network-manager-applet: GNOME frontends to NetWorkmanager')
options=('!libtool')
conflicts=('networkmanager-vpnc')
provides=('networkmanager-vpnc')
install=networkmanager-vpnc.install
source=(http://ftp.gnome.org/pub/GNOME/sources/NetworkManager-vpnc/0.8/NetworkManager-vpnc-${pkgver}.tar.bz2
        hybrid-auth-props.patch)
sha256sums=('b3802070fb25872c9cc59d82bee27b6f8ec3c3feb36b5fd148a7da2b6371c3f3'
'43ef6778d9b15cc2633df0b25847a62ff6469af4817ae4190d0648d786ca2786')

build() {
  cd "${srcdir}/NetworkManager-vpnc-${pkgver}"
  patch -Np1 -i "${srcdir}/hybrid-auth-props.patch"
  ./configure --prefix=/usr \
  	--sysconfdir=/etc \
	--libexecdir=/usr/lib/networkmanager \
	--disable-static
  make
}

package() {
  cd "${srcdir}/NetworkManager-vpnc-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
