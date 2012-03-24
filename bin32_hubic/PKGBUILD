# Contributor: Maxime Buffa <mbuffa@gmail.com>

pkgbase=hubic
pkgname=bin32_hubic
pkgver=0.3.7
pkgrel=1
pkgdesc="Browser for HubiC, the cloud computing service from French provider OVH."
arch=('x86_64')
url="http://www.ovh.fr/hubiC/"
license="Proprietary"
source=(http://hubic.labs.ovh.com/hubic/hubiC-browser-${pkgver}.tar.gz)
md5sums=('817e59940eeaf4f465b6675fa9b4d713')
depends=('lib32-qt'  'lib32-krb5')

build() {
	install -d "$pkgdir/opt"
	cp -R "$srcdir/hubiC-browser" "$pkgdir/opt"
	mv "$pkgdir/opt/hubiC-browser" "$pkgdir/opt/hubic-browser"

	find "$pkgdir/opt/hubic-browser/" -type f -exec chmod 755 {} \;
	find "$pkgdir/opt/hubic-browser/" -type d -exec chmod 755 {} \;
	chown -R root:root "$pkgdir/opt/hubic-browser"
}
