# Maintainer: Pio <xpio at tut dot by>

pkgname=chimera_chimera
_name='Chimera Chimera'
pkgver=2
pkgrel=2
pkgdesc="Puzzle platformer: You are a radioactive bear, who must absorb the abilities of other animals to reach the goal. (PyWeek game)"
arch=(any)
url="http://www.pyweek.org/e/chimera_chimera/"
license=('BSD')
depends=(pyglet avbin7)
makedepends=('gendesk')
install=${pkgname}.install
changelog=ChangeLog
source=(http://media.pyweek.org/dl/13/chimera_chimera/${pkgname}_${pkgver}.zip
		http://media.pyweek.org/dl/awards/1256/molefish.png
        ${pkgname}.sh)
md5sums=('e69d568492fe1a38d6d228a8517d87b1'
         'e492a0e8949858f178baf12f91e9c5d0'
         'f9b62161d8c76a5351f99347e560d4e2')
         
build() {
	# Generate desktop file
	cd "${srcdir}"
	gendesk -n
}

package() {
	# Copy game, readme and license
	cd "${srcdir}/${pkgname}"
	install -Dm644 README.txt "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s "/usr/share/doc/${pkgname}/README.txt" "${pkgdir}/usr/share/licenses/${pkgname}/README.txt"
	install -d "${pkgdir}/usr/share/${pkgname}"
	cp -r chimera.py config.ini images levels music sfx ${pkgdir}/usr/share/${pkgname}
	# Copy desktop file, icon and run script
	install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 ../molefish.png "${pkgdir}/usr/share/pixmaps/chimera_chimera.png"
	install -D ../${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
}
