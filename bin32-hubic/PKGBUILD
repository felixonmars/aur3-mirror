# Contributor: Soulou <leo@soulou.fr>

pkgbase=hubic
pkgname=bin32-hubic
pkgver=0.4.8
pkgrel=1
pkgdesc="Browser for HubiC, the cloud computing storage service from French provider OVH."
arch=('i686' 'x86_64')
conflicts=('bin64-hubic')
provides=('hubic')
url="http://www.ovh.fr/hubiC/"
license="Proprietary"

install=${pkgname}.install
source=(http://mir7.ovh.net/ovh-applications/hubic/hubiC-browser/${pkgver}/hubiC-browser-${pkgver}.i386.tar.gz)
md5sums=('a9e25557b14f9995978bb64eb5e49349')
depends=('qt'  'krb5')

build() {
	install -d "$pkgdir/opt"
	cp -R "$srcdir/hubiC-browser" "$pkgdir/opt"
	mv "$pkgdir/opt/hubiC-browser" "$pkgdir/opt/hubic-browser"

	find "$pkgdir/opt/hubic-browser/" -type f -exec chmod 755 {} \;
	find "$pkgdir/opt/hubic-browser/" -type d -exec chmod 755 {} \;
	chown -R root:root "$pkgdir/opt/hubic-browser"
}
