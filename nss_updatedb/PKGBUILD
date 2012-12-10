# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Timothy Gelter <timothy at gelter dot com>

pkgname=nss_updatedb
pkgver=10
pkgrel=3
pkgdesc="Maintains a local cache of network directory user and group information. When used with pam_ccreds, it provides a mechanism for disconnected use of network directories."
arch=('i686' 'x86_64')
url="http://www.padl.com/OSS/nss_updatedb.html"
license=('GPL')
depends=()
makedepends=(automake autoconf)
source=(http://www.padl.com/download/$pkgname.tgz)

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}

sha256sums=('a0f95ec12eb2a986774bf7f6738925ccb9ee588ae99d1fa7a771bd1d07676ab1')
