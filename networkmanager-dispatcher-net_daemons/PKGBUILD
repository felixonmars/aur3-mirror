# Author: Cory Schwartz <cory.is.evil@gmail.com>

pkgname=networkmanager-dispatcher-net_daemons
pkgver=2.0
pkgrel=1
pkgdesc="Control NetworkManager dispatcher services via rc.conf"
arch=(any)
license=('GPL')
url="http://gnome.org/projects/NetworkManager"
depends=('networkmanager')
source=(10-NET_DAEMONS)
sha256sums=('6bdd436c2fcc3bc2d67028d8c7c1df7f6e78b6ed8473ee4e526037abb5d6c34e')

build() {
	echo '########## ########## ########## ########## ##########'
	echo 'This custom script uses the NetworkManager dispatcher'
	echo 'to launch daemons archlinux-style using /etc/rc.conf.'
	echo 'To use this feature, you must add a NET_DAEMONS array'
	echo 'to your rc.conf. An example follows:'
	echo 
	echo 'DAEMONS=(syslong-ng crond dbus networkmanager)'
	echo 'NET_DAEMONS(iptables nscd sshd samba vsftpd httpd)'
	echo
	echo '########## ########## ########## ########## ##########'
}

package() {
	install -Dm700 $srcdir/10-NET_DAEMONS $pkgdir/etc/NetworkManager/dispatcher.d/10-NET_DAEMONS
}
