# Maintainer: Joel Goguen <jgoguen (at-sign) jgoguen (period) ca>
pkgname=lightning-gdata-provider-bin
pkgver=1.0b2rc3
pkgrel=2
_tb_ver=3.1 # Adjust this to the current thunderbird major/minor release
pkgdesc="Provides lightning with access to Google data"
arch=('i686' 'x86_64')
url="http://www.mozilla.org/projects/calendar/lightning/"
license=('MPL' 'GPL' 'LGPL')
depends=('thunderbird' 'libnotify' 'lightning-bin')
makedepends=()
options=()
provides=(lightning-gdata-provider=${pkgver})

# The XPI files are the same for i686 and x86_64
source=(http://releases.mozilla.org/pub/mozilla.org/calendar/lightning/releases/${pkgver}/linux-i686/gdata-provider.xpi)
sha256sums=(325a30c0f98efe451cb3949b0a5075f2a2d999f4f7b22f2884108a438d63df6a)

build() {
	mkdir -p ${pkgdir}/usr/lib/thunderbird-${_tb_ver}/extensions/${pkgname}
	cd ${pkgdir}/usr/lib/thunderbird-${_tb_ver}/extensions/${pkgname}
	bsdtar -x -f ${srcdir}/gdata-provider.xpi

	_emid=$(grep em:id install.rdf | head -n 1 | sed 's/.*>\(.*\)<.*/\1/')
	cd ../
	mv ${pkgname} ${_emid}
	cd ${_emid}

	# Fix permissions
	find -type d -exec chmod 0755 \{\} \+ || return 1
	find -type f -exec chmod 0644 \{\} \+ || return 1
	find -name '*.so' -exec chmod 0755 \{\} \+
}
