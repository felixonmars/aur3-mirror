# Contributor: Tyler Durden

pkgname=samsung-ml1860
pkgver=3.00.83
pkgrel=2
pkgdesc="Samsung ML-1860 Series CUPS driver."
arch=('i686' 'x86_64')
url="http://www.samsung.com"
license=('custom:samsung')
depends=('cups' 'ghostscript')
source=("http://downloadcenter.samsung.com/content/DR/201108/20110822164629356/UnifiedLinuxDriver_0.95.tar.gz")

package() {
	cd $srcdir

	install -m 644 -D \
		${srcdir}/cdroot/Linux/noarch/at_opt/share/ppd/ML-1860spl.ppd \
		${pkgdir}/usr/share/cups/model/samsung/ML-1860spl.ppd
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

md5sums=('c45d4ee2019ec97ae0e822023d75befc')
