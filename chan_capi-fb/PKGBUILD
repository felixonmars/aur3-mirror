# Contributor: Enno Lohmeier <e.lohmeier@gmx.de>
# Original Version by: <archist@gmx.de>
pkgname=chan_capi-fb
pkgver=1.1.2
pkgrel=1
pkgdesc="A module for Asterisk to provide CAPI based ISDN/Telephony hardware support. This module provides the connection between the PBX software and ISDN Hardware which provides a CAPI 2.0 compatible interface. This version is extended for Capi-over-TCP support for use with an AVM FritzBox Fon"
arch=(i686 x86_64)
url="http://www.chan-capi.org"
license=('GPL')
groups=()
depends=(asterisk libcapi20-fb)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=(etc/asterisk/capi.conf)
install=
source=(ftp://ftp.chan-capi.org/chan-capi/chan_capi-$pkgver.tar.gz 
	http://capifax.v3v.de/dl/libcapi20_fb-0.6.tar.gz)
md5sums=('e0402c91f35c44854e6eac427f749983'
	 'a9c64ecca80c8a91ce206e2f39aacd7e')
noextract=()

build() {
	cd "$srcdir/chan_capi-$pkgver"
	
	cp $srcdir/capiotcp_client/libcapi20_fb/src/* ./libcapi20/

	make || return 1
	make INSTALL_PREFIX="$pkgdir" install
	
	mkdir -p  $startdir/pkg/etc/asterisk
	install -m 644 $startdir/src/chan_capi-$pkgver/capi.conf $startdir/pkg/etc/asterisk
}

