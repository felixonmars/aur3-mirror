pkgname=dina-font-cyr
pkgver=1.01
pkgrel=1
pkgdesc='Dina font, size 15 (9pt / 120dpi), Cyrillic version (+Esperanto).'
arch=('any')
url="http://www.donationcoder.com/Software/Jibz/Dina/index.html"
license=('custom')
depends=('xorg-fonts-encodings' 'xorg-fonts-alias' 'xorg-font-utils' 'fontconfig')
install=${pkgname%-cyr}.install
source=(dina-cyr-15.pcf LICENSE)
md5sums=('0a9d48ef7e7fe99fec4f5347429de208' 'd7f8fbff7893c52e94b29c30369f2037')

build() {
	/bin/true
}

package() {
	cd ${srcdir}
	install -Dm 644 *.pcf ${pkgdir}/usr/share/fonts/local/dina-cyr.pcf
        # just a copy of the dina-font package's license
	#install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
