# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Original-Package: libnetworkmanager
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>
# Contributor: Valentine Sinitsyn <e_val@inbox.ru>

pkgname=libnetworkmanager-notify-osd
_realname=NetworkManager
pkgver=0.7.1
pkgrel=1
pkgdesc="The Network Manager Library"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnome.org/projects/NetworkManager/"
depends=('dbus-glib>=0.76' 'nss>=3.12')
makedepends=('pkgconfig' 'perlxml' 'wireless_tools' 'iproute' 'dhcpcd' 'hal' 'libnl>=1.1' 'wpa_supplicant' 'policykit' 'ppp' 'gtk-doc')
options=('!libtool')
conflicts=(libnetworkmanager)
provides=(libnetworkmanager)
#source=(http://archive.ubuntu.com/ubuntu/pool/main/n/network-manager/network-manager_0.7.1~rc3.1.git4cf2da146.orig.tar.gz)
source=(http://ftp.gnome.org/pub/gnome/sources/NetworkManager/0.7/NetworkManager-${pkgver}.tar.bz2)

build() {
  cd "$srcdir/${_realname}-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static \
	      --with-distro=arch --with-crypto=nss \
	      --with-dhcp-client=dhcpcd 
  for dir in marshallers libnm-util libnm-glib include; do
    pushd ${dir} || return 1
    make || return 1
    make DESTDIR="${pkgdir}" install || return 1
    popd
  done
}
md5sums=('954742cfd47191204d62d8d57f2bc6dd')
