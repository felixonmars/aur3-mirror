# Contributor: <archist@gmx.de>
pkgname=chan_capi
pkgver=1.1.5
pkgrel=1
pkgdesc="A module for Asterisk to provide CAPI based ISDN/Telephony hardware support. This module provides the connection between the PBX software and ISDN Hardware which provides a CAPI 2.0 compatible interface."
arch=(i686 x86_64)
url="http://www.chan-capi.org"
license=('GPL')
groups=()
depends=(asterisk16)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=(etc/asterisk/capi.conf)
install=
source=(ftp://ftp.chan-capi.org/chan-capi/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('78ec53c5964fd1bddfd68bf0d13dea9d')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	make || return 1
	make INSTALL_PREFIX="$pkgdir" install
	
	mkdir -p  $startdir/pkg/etc/asterisk
	install -m 644 $startdir/src/$pkgname-$pkgver/capi.conf $startdir/pkg/etc/asterisk
}

