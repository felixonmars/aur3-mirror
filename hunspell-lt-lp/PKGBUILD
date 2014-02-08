# Maintainer: Liudas Ališauskas <liudas@akmc.lt>

pkgname=hunspell-lt-lp
pkgver=1.3
pkgrel=2
pkgdesc="Lithuanian Hunspell Dictionary and Affix Tables (from Launchpad)"
arch=('any')
url="https://launchpad.net/ispell-lt"
license=('BSD')
depends=('hunspell')
conflicts=('hunspell-lt')
source=("https://launchpad.net/ispell-lt/main/${pkgver}/+download/myspell-lt-${pkgver}.zip")
md5sums=("11320c87b4fd39726053fe7f6647a62c") 

package() {
	cd "${srcdir}/myspell-lt-${pkgver}"
	install -dm755 "${pkgdir}/usr/share/hunspell"
	install -D -m644 "lt_LT.aff"	"${pkgdir}/usr/share/hunspell/lt_LT.aff"  
	install -D -m644 "lt_LT.dic"	"${pkgdir}/usr/share/hunspell/lt_LT.dic"
	install -D -m644 "lt_LT.aff"	"${pkgdir}/usr/share/myspell/dicts/lt_LT.aff"  
	install -D -m644 "lt_LT.dic"	"${pkgdir}/usr/share/myspell/dicts/lt_LT.dic"
	install -D -m644 "README" "${pkgdir}/usr/share/docs/hunspell-lt/README"
	install -D -m644 "COPYING" "${pkgdir}/usr/share/docs/hunspell-lt/LICENSE"
}