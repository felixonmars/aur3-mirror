# Contributor: Maxime Buffa <mbuffa@gmail.com>

pkgbase=hubic
pkgname=bin64-hubic
pkgver=0.4.8
pkgrel=1
pkgdesc="Browser for HubiC, the cloud computing storage service from French provider OVH."
arch=('x86_64')
conflicts=('bin32_hubic' 'bin32-hubic')
provides=('hubic')
url="http://www.ovh.fr/hubiC/"
license="Proprietary"

install=${pkgname}.install
source=(http://mir7.ovh.net/ovh-applications/hubic/hubiC-browser/${pkgver}/hubiC-browser-${pkgver}.${arch}.tar.gz)
md5sums=('b126f951961b6df796a41ea7e4922f10')
depends=('qt'  'krb5')

build() {
	install -d "$pkgdir/opt"
	cp -R "$srcdir/hubiC-browser" "$pkgdir/opt"
	mv "$pkgdir/opt/hubiC-browser" "$pkgdir/opt/hubic-browser"

	find "$pkgdir/opt/hubic-browser/" -type f -exec chmod 755 {} \;
	find "$pkgdir/opt/hubic-browser/" -type d -exec chmod 755 {} \;
	chown -R root:root "$pkgdir/opt/hubic-browser"
}
