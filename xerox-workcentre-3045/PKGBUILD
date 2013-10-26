# Contributor: Guilherme "nirev" Nogueira <guilherme@nirev.org>
# vim:set ts=2 sw=2 et:

pkgname=xerox-workcentre-3045
_printermodels=Xerox-WorkCentre-3045B_3045NI
pkgver=1.0
_pkgver=1.0-28
pkgrel=1
pkgdesc="Driver for the Xerox WorkCentre 3045B and 3045NI"
url="http://www.support.xerox.com/support/workcentre-3045/file-download/enza.html?operatingSystem=linux&fileLanguage=en_GB&contentId=118988"
license=('custom')
arch=('any')
depends=('cups' 'foomatic-db-engine')
makedepends=('rpmextract')
source=(http://download.support.xerox.com/pub/drivers/WC3045/drivers/linux/en_GB/${_printermodels}-${_pkgver}.i586.zip)
md5sums=('052278ab9c83d1ec08d7a4ad74c0ca6c')

prepare() {
  rpmextract.sh ${_printermodels}-${_pkgver}.i586.rpm
}

package() {
  cp -R "$srcdir"/usr "$pkgdir"
}

