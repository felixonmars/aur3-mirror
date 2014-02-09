#Maintainer devnull
#please donate
#thx in advance
#ST35DzCqyPhGPQBPjPjBkEfqgUbm7CvPUq


pkgname=smartcoin-daemon
pkgver=1.0.0.0
pkgrel=1
pkgdesc="Cryptocurrency"
arch=('x86_64' 'i686')
url="http:/http://getsmartcoin.com//"
license=('MIT')
provides=('smartcoin-daemon')
depends=('miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make' 'git')
source=('smartcoind@.service')

sha256sums=('cd365f9947e5e6558587e3b7b13353b44b1ef240652c9610610b1b6e1f8b0129')


build() {
	git clone https://github.com/smartcoin-project/smartcoin.git
	cd ${srcdir}/smartcoin/
	make -f makefile.unix -C src CXXFLAGS="$CXXFLAGS" USE_UPNP=1
}

package() {
	install -Dm644 smartcoind@.service "$pkgdir/usr/lib/systemd/system/smartcoind@.service"
	cd $srcdir/smartcoin
	install -Dm755 src/smartcoind "$pkgdir"/usr/bin/smartcoind
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

}
