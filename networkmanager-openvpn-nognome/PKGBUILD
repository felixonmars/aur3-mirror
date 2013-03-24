# $Id$
# Maintainer: max.bra <max dot bra at alice dot it>

pkgname=networkmanager-openvpn-nognome
pkgver=0.9.8.0
pkgrel=2
pkgdesc="NetworkManager VPN plugin for OpenVPN without Gnome deps"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/NetworkManager/"
depends=("networkmanager>=${pkgver}" 'openvpn')
makedepends=('intltool')
install=networkmanager-openvpn.install
options=('!libtool')
conflicts=('networkmanager-openvpn')
provides=("networkmanager-openvpn=${pkgver}")
source=(http://ftp.gnome.org/pub/GNOME/sources/NetworkManager-openvpn/0.9/NetworkManager-openvpn-${pkgver}.tar.xz)
sha256sums=('4196f4c124426884657c8d0e2578f4d35205b8981a46bf645fd599fb238395ce')

build() {
  cd NetworkManager-openvpn-${pkgver}
  ./configure --prefix=/usr \
  	--sysconfdir=/etc \
	--libexecdir=/usr/lib/networkmanager \
	--without-gnome \
	--disable-static
  make
}

package() {
  cd NetworkManager-openvpn-${pkgver}
  make DESTDIR="${pkgdir}" install
}
