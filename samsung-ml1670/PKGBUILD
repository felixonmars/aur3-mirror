# Contributor: Luigi Ranghetti luigi.ranghetti[at]gmail.com

pkgname=samsung-ml1670
pkgver=3.00.90
pkgrel=1
pkgdesc="Samsung ML-1670 CUPS driver (the version is the one indicated as working for this printer)."
arch=('i686' 'x86_64')
url="http://www.bchemnet.com/suldr/supported.html"
license=('custom:samsung')
depends=('cups>=1.6.0' 'ghostscript')
source=("http://www.bchemnet.com/suldr/driver/UnifiedLinuxDriver-${pkgver}.tar.gz")

md5sums=('a0c3c978ae0d2ce9d125f7b2ad9fe6fb')

package() {
	cd $srcdir

	install -m 644 -D \
		${srcdir}/cdroot/Linux/noarch/at_opt/share/ppd/ML-1670spl.ppd \
		${pkgdir}/usr/share/cups/model/samsung/ML-1670spl.ppd
	if [ "$CARCH" = "x86_64" ]; then
		install -m 755 -D \
			${srcdir}/cdroot/Linux/x86_64/at_root/usr/lib64/cups/filter/rastertosamsungsplc \
			${pkgdir}/usr/lib/cups/filter/rastertosamsungsplc
	else
		install -m 755 -D \
			${srcdir}/cdroot/Linux/i386/at_root/usr/lib/cups/filter/rastertosamsungsplc \
			${pkgdir}/usr/lib/cups/filter/rastertosamsungsplc
	fi
}
