# Contributor: Nicky726 <nicky726 <at> gmail <dot> com>
pkgname=fop-cs
_pkgname_orig=fop
pkgver=2
pkgrel=1
pkgdesc="Czech support for fop xslfo processor"
arch=('i686' 'x86_64')
license=('APL')
url=(http://www.kosek.cz/sw/fop/)
source=(http://www.kosek.cz/sw/${_pkgname_orig}/${pkgname}${pkgver}.zip
	${pkgname}
	${pkgname}-font-paths.patch
)
depends=('java-runtime' 'fop' 'ttf-ms-fonts')
md5sums=('47abfcfd61dbcddf504386cc73d1cdb7'
	 '812bcadef6301a5341def1bab2ba1c15'
	 '969b842b30123457d07bba56a7240b38')

build() {

	cd "${srcdir}/conf"

	# Patch font paths
	patch -Np1 -i "${srcdir}/${pkgname}-font-paths.patch" || return 1

	cd "${srcdir}"
	# Prepare directories 
	install -m755 -d "${pkgdir}/usr/share/java/${_pkgname_orig}/conf"
	install -m755 -d "${pkgdir}/usr/share/java/${_pkgname_orig}/lib"
	install -m755 -d "${pkgdir}/usr/bin"

	# Install files
	install -m644 conf/* "${pkgdir}/usr/share/java/${_pkgname_orig}/conf" || return 1
	install -m644 lib/* "${pkgdir}/usr/share/java/${_pkgname_orig}/lib" || return 1

	# Install script to /usr/bin
	install -m755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin" || return 1

}
