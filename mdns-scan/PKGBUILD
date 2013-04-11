# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Stephane Travostino <stephane.travostino@gmail.com>
pkgname=mdns-scan
pkgver="0.5"
pkgrel=3
pkgdesc="Scan mDNS/DNS-SD published services on the local network"
arch=(i686 x86_64)
url="http://0pointer.de/lennart/projects/mdns-scan/"
license=(GPL)
groups=(network)
depends=(glibc)
source=(http://0pointer.de/lennart/projects/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('9f036172ffe9f51c2c6e4db5bb7134df')

build() {
	cd "$srcdir"/$pkgname-$pkgver
	make || return 1
}
package() {
	cd "$srcdir"/$pkgname-$pkgver
	
	install -Dm755 mdns-scan   "$pkgdir"/usr/bin/mdns-scan
	install -Dm644 mdns-scan.1 "$pkgdir"/usr/share/man/man1
}

