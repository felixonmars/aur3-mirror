pkgname=hwreport
pkgver=0.11.0
pkgrel=1
pkgdesc="This is the collector for the Hardware4linux.info hardware database."
depends=('pciutils')
conflicts=('hardware4linux.info-collector')
arch=('i686' 'x86_64')
license=('GPL')
source=("http://hardware4linux.info/res/${pkgname}-${pkgver}.tar.bz2"
	"hwreport")
url="http://hardware4linux.info"
md5sums=('463109a35076dfe946ab115cd5422e6d'
	 'f95572602bb2faa25902dbe49d819ca7')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -d "${pkgdir}/usr/share/hwreport" "${pkgdir}/usr/bin"

	install -D cron.sh hwreport osinfo reportusb scan-printers "${pkgdir}/usr/share/hwreport/"
	install -D "${srcdir}/hwreport" "${pkgdir}/usr/bin"
}
