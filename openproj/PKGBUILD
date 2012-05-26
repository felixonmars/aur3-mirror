# Contributor: Fabio Falcinelli < fabio.falcinelli@gmail.com >
# Maintainer: moostik <mooostik_at_gmail.com>

pkgname=openproj
pkgver=1.4
pkgrel=4
pkgdesc="A free, open source desktop alternative to Microsoft Project"
arch=('any')
url="http://www.openproj.org"
license=('custom:"CPAL"')
depends=('java-runtime')
source=(http://downloads.sourceforge.net/${pkgname}/OpenProj%20Binaries/1.4/${pkgname}-${pkgver}.tar.gz
	${pkgname}.desktop 
	${pkgname}.sh
	LICENSE)
md5sums=('07f0db8c6f171f816392ceaba244fd10'
         '23d36dae08b6a9ca2cf8d77a46f5a94c'
         '257fdb9c51d9d3f79bfac9d56178a0b0'
         'de444797af6f06710e88a3d1a6583219')

package() {
	# Installing license
	install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/openproj/LICENSE"
	cp -R "${srcdir}/${pkgname}-${pkgver}/license/third-party" "${pkgdir}/usr/share/licenses/openproj/"

	# Installing menu item
	install -D -m644 "${srcdir}/openproj.desktop" "${pkgdir}/usr/share/applications/openproj.desktop"

	# Installing application
	cp -R "${srcdir}/${pkgname}-${pkgver}/lib" "${pkgdir}/usr/share/openproj"
	install -D -m644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.bat" "${pkgdir}/usr/share/openproj"
	install -D -m644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.jar" "${pkgdir}/usr/share/openproj"

	# Installing launcher
	install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
