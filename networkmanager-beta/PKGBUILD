# Contributor: Det <nimetonmaili at gmail a-dot com>
# Contributor: Petr Novák <n_petr at seznam dot cz>
# Based on the networkmanager package trunk

_pkgname=networkmanager
pkgname=$_pkgname-beta
pkgver=0.9.2.0
pkgrel=1
pkgdesc="Network Management daemon - Bleeding edge version"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/NetworkManager/"
depends=('dbus-glib' 'iproute2' 'libnl' 'nss' 'polkit' 'udev' 'wireless_tools' 'wpa_supplicant' 'ppp' 'dhcpcd')
makedepends=('intltool' 'dhclient' 'iptables' 'gobject-introspection')
optdepends=('modemmanager: for modem management service'
            'dhclient: alternative DHCP/DHCPv6 client'
            'iptables: Connection sharing'
            'dnsmasq: Connection sharing'
            'bluez: Bluetooth support'
            'openresolv: openresolv support')
provides=("$_pkgname")
conflicts=("$_pkgname=$pkgver")
options=('!libtool')
backup=('etc/NetworkManager/NetworkManager.conf')
install=$pkgname.install
source=("http://ftp.gnome.org/pub/gnome/sources/NetworkManager/0.9/NetworkManager-$pkgver.tar.xz"
        'NetworkManager.conf'
        'disable_set_hostname.patch')
sha256sums=(`curl -s ${source/ta*}sha256sum | grep xz | cut -d " " -f1`
            '44b048804c7c0b8b3b0c29b8632b6ad613c397d0a1635ec918e10c0fbcdadf21'
            '25056837ea92e559f09563ed817e3e0cd9333be861b8914e45f62ceaae2e0460')

build() {
  cd NetworkManager-$pkgver

  patch -Np1 -i ../disable_set_hostname.patch

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/networkmanager \
    --with-crypto=nss \
    --with-distro=arch \
    --with-dhclient=/usr/sbin/dhclient \
    --with-dhcpcd=/sbin/dhcpcd \
    --with-iptables=/usr/sbin/iptables \
    --with-systemdsystemunitdir=/lib/systemd/system \
    --with-resolvconf=/usr/sbin/resolvconf \
    --disable-static \
    --enable-more-warnings=no \
    --disable-wimax

  make
}

package() {
  cd NetworkManager-$pkgver
  make DESTDIR="$pkgdir" install

  install -m644 ../NetworkManager.conf "$pkgdir/etc/NetworkManager/"

  rm -rf "$pkgdir/var/run/"
}