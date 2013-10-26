# Maintainer: Florian Zeitz <florob@babelmonkeys.de>
pkgname=livemedia
pkgver=2013.10.16
pkgrel=1
pkgdesc="multimedia RTSP streaming library"
arch=('i386' 'x86_64')
url="http://www.live555.com/liveMedia/"
license=('GPL')
depends=('gcc-libs')
source=(http://www.live555.com/liveMedia/public/live.$pkgver.tar.gz)
md5sums=('026249313f4e9220bde5c24a43d67ace')

build() {
	cd "$srcdir/live"
	./genMakefiles linux
	make PREFIX="/usr"
}

package() {
	cd "$srcdir/live"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
