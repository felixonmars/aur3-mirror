# Maintainer: Perberos <perberos@gmail.com>
pkgname=cosmicbreak-jp
pkgver=1.133.0
pkgrel=20110625
pkgdesc="CosmicBreak is an MMO third person shooter featuring massive PvP battles of up to 30 vs. 30 players at one time. Familiar WASD control and fast-paced Arena action makes CosmicBreak quick and easy to get into for any gamer. This is the Japanese version."
arch=('any')
url="http://www.cosmicbreak.com/"
license=('custom:eula')
depends=('wine' 'icoutils')
makedepends=('cabextract')
source=(${pkgname}.desktop
		${pkgname}.sh)
md5sums=('cc350156b0007d723841c5279cc0cd84'
         'c0e20bd742b83b081f36a7bb7ca962ed')

install=${pkgname}.install
_fileinstaller="CosmicBreakSetup.exe"

package() {

	# hago esto para que en caso de que actualicen el ejecutable, no tire error
	# de md5sum
	# si, muy malo
	wget -c http://210.155.155.250/download/CosmicBreakSetup.exe
	# carpetas basicas
	install -dm775 ${pkgdir}/opt/${pkgname}
	install -dm644 ${pkgdir}/usr/share/licenses/${pkgname}/
	install -dm644 ${pkgdir}/usr/share/doc/${pkgname}/

	# el archivo ejecutable se puede descomprimir como .cab
	cabextract --directory=${pkgdir}/opt/${pkgname}/ ${_fileinstaller}
	
	# quitando archivos sin usar
	rm -f ${pkgdir}/opt/${pkgname}/install-panel.bmp
	rm -f ${pkgdir}/opt/${pkgname}/install-icon.bmp
	rm -f ${pkgdir}/opt/${pkgname}/cs-banner.bmp
	rm -f ${pkgdir}/opt/${pkgname}/CosmicBreak.com.URL
	
	# grupo y permisos
	chgrp games -R ${pkgdir}/opt/${pkgname}/
	chmod 775 -R ${pkgdir}/opt/${pkgname}/
	
	# extracción de los iconos
	wrestool -x -n 256 ${pkgdir}/opt/${pkgname}/CosmicBreak.exe > \
		${srcdir}/${pkgname}.ico
	convert ${srcdir}/${pkgname}.ico ${srcdir}/cosmicbreak.png
	
	# movemos la licencia y copyright a su debida carpeta
	mv ${pkgdir}/opt/${pkgname}/CosmicBreak*/*.txt \
		${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	mv ${pkgdir}/opt/${pkgname}/readme.txt \
		${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT
	# la versión en japones, no tiene el manual
	#mv ${pkgdir}/opt/${pkgname}/StageEditorManual.pdf \
	#	${pkgdir}/usr/share/doc/${pkgname}/
	
	# quitando esta carpeta con nombre extraño
	rm -r ${pkgdir}/opt/${pkgname}/CosmicBreak*/
	
	# menu icon
	install -Dm644 ${srcdir}/${pkgname}.desktop \
		${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -Dm644 ${srcdir}/${pkgname}.sh \
		${pkgdir}/usr/bin/${pkgname}
	chmod +x ${pkgdir}/usr/bin/${pkgname}
	
	# los iconos
	install -Dm644 ${srcdir}/cosmicbreak-0.png \
		${pkgdir}/usr/share/icons/hicolor/16x16/apps/${pkgname}.png
	install -Dm644 ${srcdir}/cosmicbreak-2.png \
		${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png
	install -Dm644 ${srcdir}/cosmicbreak-4.png \
		${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png
	
	rm ${srcdir}/cosmicbreak-*.png
}
