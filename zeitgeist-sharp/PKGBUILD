# Maintainer: Alexander De Sousa <archaur.xandy21@spamgourmet.com>

pkgname="zeitgeist-sharp"
pkgdesc="Mono DBus API wrapper for Zeitgeist."
pkgver=0.8.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://launchpad.net/zeitgeist-sharp"
license=('MIT')
depends=('mono' 'dbus-sharp' 'dbus-sharp-glib' 'zeitgeist')
source=(http://launchpad.net/$pkgname/${pkgver%.*}/$pkgver/+download/$pkgname-$pkgver.0.tar.gz)
md5sums=("8f7bdd8162300379ced0334edf6859d6")
sha1sums=("6518322ec16db886b1385a764acf5fd232798d6b")

build() {
	cd "$srcdir/$pkgname-$pkgver.0"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver.0"
	make DESTDIR="$pkgdir" install
}

# vim: set ft=sh ts=3 sw=3 tw=0:
