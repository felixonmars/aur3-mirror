# Contributor: Guilherme "nirev" Nogueira <guilherme@nirev.org>
# vim:set ts=2 sw=2 et:

pkgname=xerox-workcentre-7242
_printermodels=Xerox-WorkCentre-3045B_3045NI
pkgver=1.0
_pkgver=1.0-28
pkgrel=1
pkgdesc="Driver for the Xerox WorkCentre 7232 and 7242"
url="http://www.support.xerox.com/support/workcentre-7232-7242/file-download/enus.html?operatingSystem=linux&fileLanguage=en&contentId=61334"
license=('custom')
arch=('any')
depends=('cups' 'foomatic-db-engine')
source=(http://download.support.xerox.com/pub/drivers/DocuColor_2006/drivers/unix/en/LinuxCupsPrinterPkg.tar.gz)
sha512sums=('863285933b182ae6c79fc039a4a23440638caf4f51c36fc8de78fdb4d269dcaf76383f73e523d993b8549e7cd889289bd2974311123fd0e3d3d1fce6a2c80756')

package() {
  mkdir -p "$pkgdir/usr/share/cups/model/Xerox/"
  cp -R "$srcdir"/LinuxCupsPrinterPkg/xrx7242.ppd "$pkgdir/usr/share/cups/model/Xerox/"
  gzip "$pkgdir/usr/share/cups/model/Xerox/xrx7242.ppd"
}

