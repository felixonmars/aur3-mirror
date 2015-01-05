# Maintainer: lakotajames <lakota.james at gmail dot com>
# Based on minecraft-technic-launcher package by kozec;
# in turn based on minecraft package by Christophe Robin
pkgname=technic-launcher4
pkgver=211
pkgrel=1
pkgdesc="Minecraft mod collection and launcher by TechnicPack.net"
arch=(any)
license=('gpl2')
url="http://www.technicpack.net/"
depends=('java-runtime' 'xorg-server-utils' 'openal')
source=(technic-launcher
	http://launcher.technicpack.net/launcher4/${pkgver}/TechnicLauncher.jar
	technic-launcher.desktop technic-launcher.png)

build() {
	true
}

package() {
	cd "$srcdir" || return 1

	install -D -m755 "${srcdir}/technic-launcher" "${pkgdir}/usr/bin/technic-launcher"
	install -D -m644 "${srcdir}/TechnicLauncher.jar" "${pkgdir}/usr/share/technic-launcher/technic-launcher.jar"

	# Desktop launcher with icon
	install -D -m644 "${srcdir}/technic-launcher.desktop" "${pkgdir}/usr/share/applications/technic-launcher.desktop"
	install -D -m644 "${srcdir}/technic-launcher.png" "${pkgdir}/usr/share/pixmaps/technic-launcher.png"
}

md5sums=('e23303846062cf3edf7e9cadc3e578ef'
         'aa75b1507c346bcdca9031ff3704aacf'
         '0227e827bd02ed3e720aa0f9edaf6645'
         'c33a1167195c774ff1f780f1ed712e87')



