pkgname=novacoin-daemon
pkgver=0.4.4.5
pkgrel=1
pkgdesc="Cryptocurrency"
arch=('x86_64' 'i686')
url="http://novacoin.org/"
license=('MIT')
provides=('novacoin-daemon')
depends=('miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make' 'git')
source=('novacoind@.service')

sha256sums=('b6c5819fbebab03f903218b8d83328ea6d754e930738d4ee3c35099980712d9f')


build() {
	git clone https://github.com/novacoin-project/novacoin/
	cd ${srcdir}/novacoin/src
	make -f makefile.unix  USE_UPNP=1

}

package() {
	install -Dm644 novacoind@.service "$pkgdir/usr/lib/systemd/system/novacoind@.service"
	cd $srcdir/novacoin
	install -Dm755 src/novacoind "$pkgdir"/usr/bin/novacoind
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

}
