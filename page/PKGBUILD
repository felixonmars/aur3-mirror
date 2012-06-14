# Maintainer: Ruben Schuller <r.schuller@orgizm.net>

pkgname=page
pkgver=3.4
pkgrel=1
pkgdesc="A Python (Tk)GUI generator."
arch=('i686' 'x86_64')
url="http://page.sourceforge.net"
license=('GPL')
depends=('tk' 'tcl')
source=(http://garr.dl.sourceforge.net/project/page/page/${pkgver}/page-${pkgver}.tgz)
sha1sums=('caeb29acae1beaddc9fef2b23dc29d131106f81b')

build() {
	echo
	${srcdir}/${pkgname}/configure

	# i don't know why this mv-ing is needed. if not performed the file is empty.
	cat "${srcdir}/${pkgname}/page" | sed "s/PAGE_HOME=.*/PAGE_HOME=\/usr\/share\/page/" > "${srcdir}/${pkgname}/foo"
	mv "${srcdir}/${pkgname}/foo" "${srcdir}/${pkgname}/page"
}

package() {
	cd "${srcdir}/${pkgname}"
	mkdir -p "${pkgdir}/usr/share"
	cp -r "${srcdir}/${pkgname}" "${pkgdir}/usr/share"
	mkdir -p "${pkgdir}/usr/bin"
	mv "${pkgdir}/usr/share/${pkgname}/page" "${pkgdir}/usr/bin/page-gui-generator"
	chmod a+x "${pkgdir}/usr/bin/page-gui-generator"
}
