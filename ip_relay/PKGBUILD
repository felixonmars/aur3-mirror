# Contributor: solsTiCe d'Hiver <solstice.dhiver@gmail.com>

pkgname=ip_relay
pkgver=0.71
pkgrel=1
pkgdesc="proxy that shape the TCP traffic forwarded through it to a specified bandwidth"
arch=('any')
url="http://www.stewart.com.au/ip_relay/"
license=("GPL2")
depends=('perl')
source=(http://www.stewart.com.au/ip_relay/ip_relay-$pkgver.tgz)
md5sums=('5b6761ceee4eaa13028e7a7e8c194c1c')

build() {
	cd $srcdir/$pkgname-$pkgver
	mkdir -p $pkgdir/usr/{bin,share/doc/ip_relay}
	install -m755 ip_relay.pl $pkgdir/usr/bin
	install -m755 README $pkgdir/usr/share/doc/ip_relay
}

