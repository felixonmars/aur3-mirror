# Maintainer: Bruno Carnazzi <bcarnazzi at gmail dot com>
pkgname=nm-dispatcher-vpnguard
pkgver=0.5
pkgrel=4
pkgdesc="Reconnect automatically NetworkManager's VPN connections"
url="http://code.google.com/p/nm-dispatcher-vpnguard/"
arch=('any')
license=('BSD')
depends=('networkmanager')
backup=('etc/nm-dispatcher-vpnguard.conf')
install="$pkgname.install"
source=(http://nm-dispatcher-vpnguard.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('a7a5b3f948999e14929a0686ec3faa0e')

package() {
	install -D -o root -g root -m 755 $srcdir/20_vpnguard $pkgdir/etc/NetworkManager/dispatcher.d/20_vpnguard
	install -D -o root -g root -m 644 $srcdir/nm-dispatcher-vpnguard.conf $pkgdir/etc/nm-dispatcher-vpnguard.conf
	install -D -o root -g root -m 644 $srcdir/COPYING.BSD $pkgdir/usr/share/licenses/$pkgname/COPYING.BSD
}
