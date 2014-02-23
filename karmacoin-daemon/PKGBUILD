#devnull
#KWCiz5sgKj4z8xtYxqK2ZN2t7b12v8ukym


pkgname=karmacoin-daemon
pkgver=git
pkgrel=1
pkgdesc="Cryptocurrency"
arch=('x86_64' 'i686')
url="http://karmacoin.info/"
license=('MIT')
provides=('karmacoin-daemon')
depends=('miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make' 'git')
source=('karmacoind@.service')

sha256sums=('d116710cee1c4acb79210902bf8cf36bf61664c3dae18e3b4bb3cd78488c88b9')


build() {
	git clone https://github.com/karmacoin-team/karmacoin.git
	cd ${srcdir}/karmacoin/
	make -f makefile.unix -C src CXXFLAGS="$CXXFLAGS" USE_UPNP=1
}

package() {
	install -Dm644 karmacoind@.service "$pkgdir/usr/lib/systemd/system/karmacoind@.service"
	cd $srcdir/karmacoin
	install -Dm755 src/karmacoind "$pkgdir"/usr/bin/karmacoind
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

}
