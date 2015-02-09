# Maintainer: Simon Persson <simon at flaskpost dot org>
pkgname=spotifyd
pkgver=r71.e510b04
pkgrel=1
pkgdesc="A spotify playing daemon in the spirit of mpd."
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="http://simonpersson.github.io/spotifyd/"
license=('GPLv3')
depends=('libspotify' 'alsa-lib')
source=("git+https://github.com/SimonPersson/spotifyd.git")
md5sums=('SKIP')
pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
	cd "$srcdir/$pkgname"
	make
}
package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir"/usr/bin/
	mkdir -p "$pkgdir"/usr/lib/systemd/system/
	make PREFIX="/usr" DESTDIR="$pkgdir" install
	install init/spotifyd.service "$pkgdir"/usr/lib/systemd/system/spotifyd.service
}
