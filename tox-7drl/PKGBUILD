# Maintainer: Pio <xpio at tut dot by>
pkgname=tox-7drl
_name='Tox: Puzzle Roguelike'
pkgver=0.1
pkgrel=1
pkgdesc="Simple, graphical, drug-themed roguelike game"
arch=(any)
url="http://7drl.org/2014/03/17/tox-puzzle-roguelike-dont-do-drugs-kids"
license=('unknown')
depends=(java-runtime)
makedepends=('gendesk')
source=(http://7drl.org/wp-content/uploads/2014/03/${pkgname}-desktop-v${pkgver}.zip)
md5sums=('90988af03f4bd64914f91e68d152f844')

build() {
	# Generate desktop file
	cd "${srcdir}"
	gendesk -n -f
}

package() {
	# Just copy everything to /opt
	cd "${srcdir}/${pkgname}-desktop-v${pkgver}"
	install -D bin/tox ${pkgdir}/opt/${pkgname}/bin/${pkgname}
	for _a in lib/*
		do install -Dm644 ${_a} ${pkgdir}/opt/${pkgname}/${_a}
	done
	# Extract an image to be used as icon
	unzip -p lib/desktop-1.0.jar icon128x128.png > ../${pkgname}.png
	# Copy desktop file, icon and run script
	install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 ../${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -d ${pkgdir}/usr/bin
	ln -s /opt/${pkgname}/bin/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
