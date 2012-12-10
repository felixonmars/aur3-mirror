# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Timothy Gelter <timothy at gelter dot com>

pkgname=pam_ccreds
pkgver=10
pkgrel=2
pkgdesc="Provides the means for Linux workstations to locally authenticate using an enterprise identity when the network is unavailable."
arch=('i686' 'x86_64')
url="http://www.padl.com/OSS/pam_ccreds.html"
license=('GPL')
depends=('pam' 'openssl')
source=(http://www.padl.com/download/$pkgname.tgz)

build() {
	cd "$srcdir/$pkgname-$pkgver"
	rm missing

	aclocal
	automake -ac
	autoconf
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm755 cc_dump cc_test "$pkgdir/usr/sbin"
}

sha256sums=('1f3a737ce0653cd6267e04c3c11f3d1ebc26042f49e6ed7764c9c0b0c2f3ffc0')
