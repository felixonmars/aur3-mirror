# Maintainer: Ivan Turkin <somebody2112 at yandex.ru>
# Contributor: hadzhimurad ustarkhan - hmurad dot ust at gmail dot com
# Contributor: Joel Almeida <aullidolunar at gmail dot c0m>

pkgname=transmission-gtk2
pkgver=2.60
pkgrel=2
pkgdesc="Fast, easy, and free BitTorrent client (GTK2 GUI)"
arch=('i686' 'x86_64')
url="http://www.transmissionbt.com/"
license=('MIT')
depends=('curl' 'libevent' 'gtk2' 'desktop-file-utils' 'hicolor-icon-theme')
optdepends=('notification-daemon: Desktop notification support' 'transmission-cli: daemon and web support')
makedepends=('intltool')
provides=('transmission-gtk')
conflicts=('transmission-gtk')
source=("http://mirrors.m0k.org/transmission/files/transmission-$pkgver.tar.xz")
md5sums=('2aff84c29a3c4b51ac5682a89d96bda5')

build() {
	cd "$srcdir/transmission-${pkgver}"
	./configure --prefix=/usr --disable-cli --disable-daemon --with-gtk=2
	make
}

package() {
	cd "$srcdir/transmission-$pkgver"
	make DESTDIR="$pkgdir/" install
}
