# Maintainer: Roy Lines <roy@roylines.co.uk>

pkgname=phonegap
pkgver=2.9.1
pkgrel=1
pkgdesc="Access core functions on Android, iPhone and Blackberry using JavaScript."
arch=('any')

url="https://github.com/phonegap/phonegap"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/phonegap/${pkgname}/tarball/${pkgver}")

build() {
	tar -xvzf ${pkgname}-${pkgver}.tar.gz
}

package() {
	cd "$pkgdir"
	mkdir -p opt
	cp -a "$srcdir/${pkgname}-${pkgname}-"* opt/$pkgname
	chmod -R o=g opt/$pkgname
}
sha256sums=('ee80df5033ddaf283ad82019ca5763f564e10baab3f5d2977eeb2e05475ce0cc')
