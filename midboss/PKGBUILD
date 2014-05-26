# Maintainer: Pio <xpio at tut dot by>
pkgname=midboss
pkgver=0.5beta
pkgrel=3
pkgdesc="A small roguelike game about possessing your defeated enemies in order to become stronger, classic version"
arch=(any)
url="http://www.midboss.net/classic"
license=('CCPL:by-nc-sa' 'custom')
depends=(python2-pygame)
makedepends=('gendesk')
source=($url/download/MidBoss_Src.zip
        $url/download/MidBoss_Other.zip
        ${pkgname}.sh)

md5sums=('d2e14f8aa51927fe91dc0660bb3aa8a8'
         'ab071aa2f0040f8636d4360666b38665'
         'bd136a2facc3d3c934d33f5b674fcc90')

build() {
	# Generate desktop file
	cd "${srcdir}"
	gendesk -n
}

package() {
	# Copy sources and license
	cd "${srcdir}/MidBoss_src"
	install -d "${pkgdir}/usr/share/${pkgname}"
	cp * "${pkgdir}/usr/share/${pkgname}"
	install -Dm644 readme.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Copy media and docs
	cd "${srcdir}/MidBoss_Other"
	cp -r image music misc sound "${pkgdir}/usr/share/${pkgname}"
	install -Dm644 readme.txt "${pkgdir}/usr/share/doc/${pkgname}/readme.txt"

	# Copy desktop file, icon and run script
	install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 misc/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -D ../${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
}
