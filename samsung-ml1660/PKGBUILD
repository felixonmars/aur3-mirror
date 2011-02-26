# Contributor: Vitaliy Berdinskikh ur6lad[at]archlinux.org.ua

pkgname=samsung-ml1660
pkgver=3.00.65
pkgrel=4
pkgdesc="Samsung ML-1660 Series CUPS driver. Works with ML-1660, ML-1661, ML-1665, ML-1666, ML-1667 printers."
arch=('i686' 'x86_64')
url="http://www.samsung.com"
license=('custom:samsung')
depends=('cups' 'ghostscript')
source=("http://downloadcenter.samsung.com/content/DR/201001/20100121132724343/UnifiedLinuxDriver_0.86.tar.gz")
changelog=CHANGELOG.markdown

package() {
	cd $srcdir

	install -m 644 -D \
		${srcdir}/cdroot/Linux/noarch/at_opt/share/ppd/ML-1660spl.ppd \
		${pkgdir}/usr/share/cups/model/samsung/ML-1660spl.ppd
	if [ "$CARCH" = "x86_64" ]; then
		install -m 755 -D \
			${srcdir}/cdroot/Linux/x86_64/at_root/usr/lib64/cups/filter/rastertosamsungspl \
			${pkgdir}/usr/lib/cups/filter/rastertosamsungspl
	else
		install -m 755 -D \
			${srcdir}/cdroot/Linux/i386/at_root/usr/lib/cups/filter/rastertosamsungspl \
			${pkgdir}/usr/lib/cups/filter/rastertosamsungspl
	fi
}

md5sums=('4ca29f01fea2afc1187d7cba515f42b5')
sha256sums=('3e7538e1e5cb10acaa10ac0967b2e61d55fec8080df132e7763d5e61fb36d8a1')
