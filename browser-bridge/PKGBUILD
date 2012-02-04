# Maintainer: Tim Gerhard <tim-gerhard@schnellbach-beltheim.de>
pkgname=browser-bridge
pkgver=0.1.1
pkgrel=1
depends=()
makedepends=('go')
pkgdesc="Open URLs on another computer"
arch=('any')
url="http://code.google.com/p/browser-bridge/"
license=('GPL')
options=(!strip)
backup=(etc/browserbridge/browserbridge.conf)
source=(http://browser-bridge.googlecode.com/files/browserbridge_v0.1.1_source.tar.gz)
md5sums=(c6ed436e7fcba6e42fa0aebe3cfe163e)

build() {
	cd $srcdir/browserbridge
	bash ./build_all.sh
}

package() {
	cd $srcdir/browserbridge
	mkdir -p ${pkgdir}/etc/browserbridge/
	mkdir -p ${pkgdir}/usr/bin
	install -m644 browserbridge.conf ${pkgdir}/etc/browserbridge/
	install -m755 browser-bridge ${pkgdir}/usr/bin/
	install -m755 browser-bridge_server ${pkgdir}/usr/bin/
}
