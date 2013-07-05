# Based on PKGBUILD provided by Contributors
# Contributor: Joel Goguen <jgoguen (at-sign) jgoguen (period) ca>
# Contributor: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>
# Maintainer: Arne Ko arneko yahoo com
pkgname=seamonkey-lightning-bin
pkgver=2.4b1
pkgrel=2
pkgdesc="A version of Mozilla Sunbird integrated with Seamonkey"
arch=('i686' 'x86_64')
url="http://www.mozilla.org/projects/calendar/lightning/"
license=('MPL' 'GPL' 'LGPL')
depends=('seamonkey>=2.19' 'libnotify')
makedepends=()
options=(!strip)
provides=(lightning=${pkgver})

source=(lightning-$pkgver.xpi::https://addons.mozilla.org/thunderbird/downloads/file/209790/lightning-$pkgver-tb+sm-linux.xpi)

sha1sums=('dd0401f02a8f8ac2556faec42ae3c58047fb884f')

build() {
	mkdir -p ${pkgdir}/usr/lib/seamonkey-2.19/extensions/${pkgname}
	cd ${pkgdir}/usr/lib/seamonkey-2.19/extensions/${pkgname}
	bsdtar -x -f ${srcdir}/lightning-$pkgver.xpi

	_emid=$(grep em:id install.rdf | tail -n 1 | sed 's/.*>\(.*\)<.*/\1/')
	cd ../
	mv ${pkgname} ${_emid}
	cd ${_emid}

	# Fix permissions
	find -type d -exec chmod 0755 \{\} \+
	find -type f -exec chmod 0644 \{\} \+
	find -name '*.so' -exec chmod 0755 \{\} \+
}
