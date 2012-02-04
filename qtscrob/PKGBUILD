# Contributor: Georgij Kondratjev <smpuj@bk.ru>
pkgname=qtscrob
pkgver=0.10
pkgrel=3
pkgdesc="Last.fm scrobbler (QTScrobbler + scrobble-cli) supporting Apple iPods or DAPs running the Rockbox replacement firmware"
arch=("i686" "x86_64")
url="http://qtscrob.sourceforge.net/"
license=("GPL")
depends=('qt' 'curl' 'libmtp')
makedepends=()
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('5d1e477dcf8f9fba89a77715c02b1403')
install=xdg-icon.install

build() {
	cd "$startdir/src/$pkgname-$pkgver/src/cli"
	make || return 1
	install -Dm755 scrobble-cli "$startdir/pkg/usr/bin/scrobble-cli"
	cd ../qt
	prefix=/usr qmake || return 1
	make || return 1
	make INSTALL_ROOT="$pkgdir" install || return 1
}
# vim: ts=2
