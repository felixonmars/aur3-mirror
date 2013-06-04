# Original firehol contributors:
#    Jakob Gruber <jakob.gruber@gmail.com>
#    Geoffroy Carrier <geoffroy.carrier@koon.fr>
#    Filip Dvorak <fila@pruda.com>
# Contributor: russo79 (AUR)
# Maintainer: SanskritFritz (gmail)

pkgname=sanewall
pkgver=1.0.2
pkgrel=2
pkgdesc='Fork of Firehol (the iptables stateful packet filtering firewall builder)'
url="http://www.sanewall.org/"
arch=('any')
license=('GPL')
depends=('iptables' 'gawk' 'iproute')
backup=('etc/sanewall/sanewall.conf')
#conflicts=('firehol')
source=("http://download.sanewall.org/releases/${pkgver}/sanewall-${pkgver}.tar.gz" sanewall.service)

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --sysconfdir="/etc" --sbindir="/usr/bin"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make prefix="$pkgdir/usr" sysconfdir="$pkgdir/etc" sbindir="$pkgdir/usr/bin" install

	install -D -m644 "$srcdir/sanewall.service" "$pkgdir/usr/lib/systemd/system/sanewall.service"

	# backup does not work if the file is not contained in the package
	# plus, creating it in post_install will set 777 permissions and we dont want that
	mkdir --parents "$pkgdir/etc/sanewall"
	touch "$pkgdir/etc/sanewall/sanewall.conf"
	chmod 600 "$pkgdir/etc/sanewall/sanewall.conf"
}

md5sums=('d9675c2f5f7c441c1709a85ae8213b73'
         '751847c64806c07c8f864e36ce0a65ce')
