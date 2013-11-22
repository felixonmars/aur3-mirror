# Contributor: Joel Goguen <jgoguen (at-sign) jgoguen (period) ca>
# Maintainer: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>
pkgname=lightning-bin
pkgver=2.6.3
pkgrel=1
pkgdesc="A version of Mozilla Sunbird integrated with Thunderbird"
arch=('i686' 'x86_64')
url="https://blog.mozilla.org/calendar/"
license=('MPL' 'GPL' 'LGPL')
depends=('thunderbird>=24.1.1' 'libnotify')
makedepends=()
options=(!strip)
provides=(lightning=${pkgver})

source=(lightning-$pkgver.xpi::https://ftp.mozilla.org/pub/mozilla.org/calendar/lightning/releases/${pkgver}/linux/lightning.xpi)
sha1sums=('9fbb88e5e679bda0b3fb5a5cd19ffd66afc837fb')

package() {
	mkdir -p ${pkgdir}/usr/lib/thunderbird/extensions/${pkgname}
	cd ${pkgdir}/usr/lib/thunderbird/extensions/${pkgname}
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
