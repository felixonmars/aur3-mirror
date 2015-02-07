# Maintainer: Webstrand <webstrand@gmail.com>
pkgname=rimworld
pkgver=0.8.671
pkgrel=1
pkgdesc="RimWorld follows three survivors from a crashed space liner as they build a colony on a frontier world at the rim of the galaxy."
arch=('i686' 'x86_64')
url="http://rimworldgame.com/"
license=('custom')
depends=(glu glibc gcc-libs-multilib libxcursor libxrandr)
source=("RimWorldAlpha8fLinux.zip"
        "rimworld")
md5sums=('d5773f8460dbf6f81bbaee6eac2372d5'
         'c5a3d50495fe040e4fc61f4551b29c4d')
package() {
	cd "${srcdir}/RimWorld671Linux"

	destdir="${pkgdir}/usr/share/${pkgname}"
	install -dm755 "${destdir}/"

	cp -r "RimWorld671Linux_Data"   "${destdir}/Data"
	cp -r "Mods"                          "${destdir}/Mods"

	find "${destdir}" -type d -exec chmod 755 {} +
	find "${destdir}" -type f -exec chmod 644 {} +

	install -Dm755 "../${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	suffix='x86'
	if [ $CARCH = 'x86_64' ]; then
		suffix='x86_64'
	fi

	install -Dm755 "RimWorld671Linux.${suffix}" "${destdir}/${pkgname}.bin"
}
