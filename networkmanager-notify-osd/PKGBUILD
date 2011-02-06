# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Original-Package: networkmanager
# Maintainer: Jan de Groot <jgc@archlinxu.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>
# Contributor: Valentine Sinitsyn <e_val@inbox.ru>

pkgname=networkmanager-notify-osd
pkgver=0.7.1
pkgrel=1
pkgdesc="Network Management daemon"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/NetworkManager/"
depends=('wireless_tools' 'iproute' 'hal>=0.5.11-7' 'libnl>=1.1' 'ppp' 'dhcpcd>=4.0' 'wpa_supplicant>=0.5.11' "libnetworkmanager-notify-osd>=${pkgver}")
makedepends=('pkgconfig' 'perlxml')
options=('!libtool' '!makeflags')
backup=('etc/NetworkManager/nm-system-settings.conf')
conflicts=(networkmanager)
provides=(networkmanager)
#source=(http://archive.ubuntu.com/ubuntu/pool/main/n/network-manager/network-manager_0.7.1~rc3.1.git4cf2da146.orig.tar.gz
#        nm-system-settings.conf)
source=(http://ftp.gnome.org/pub/gnome/sources/NetworkManager/0.7/NetworkManager-${pkgver}.tar.bz2
	nm-system-settings.conf)

build() {
  cd "$srcdir/NetworkManager-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --with-distro=arch --localstatedir=/var \
      --libexecdir=/usr/lib/networkmanager \
      --disable-static --with-dhcp-client=dhcpcd \
      --with-crypto=nss || return 1
  
  make || return 1
  sed -i -e 's/\slibnm-util\s/ /' -e 's/\slibnm-glib\s/ /' -e 's/\sinclude/ /' Makefile || return 1
  make DESTDIR="${pkgdir}" install || return 1
  install -d -m755 "${pkgdir}/usr/bin"
  install -m755 test/.libs/nm-tool "${pkgdir}/usr/bin/" || return 1
  install -m644 "${srcdir}/nm-system-settings.conf" "${pkgdir}/etc/NetworkManager/" || return 1
}


md5sums=('954742cfd47191204d62d8d57f2bc6dd'
         '1653159d6634fb62d3a5c548b7a56151')
