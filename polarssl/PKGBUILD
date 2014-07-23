# Maintainer: Mihai Militaru <mihai militaru at xmpp dot ro>
# Contributor: carstene1ns <arch carsten-teibes.de>

pkgname=polarssl
pkgver=1.3.8
pkgrel=1
pkgdesc="Portable cryptographic and SSL/TLS library"
arch=('i686' 'x86_64')
url="http://www.polarssl.org/"
license=('GPL2')
source=(http://www.polarssl.org/code/releases/polarssl-$pkgver-gpl.tgz)
sha1sums=('82ed8ebcf3dd53621da5395b796fc0917083691d')
depends=('glibc')
options=(staticlibs)

build() {
	cd $pkgname-$pkgver
	LDFLAGS+=" -I../include " make SHARED=1 no_test
}

check() {
	cd $pkgname-$pkgver
	LDFLAGS+=" -static " make check
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR=$pkgdir/usr install
}
