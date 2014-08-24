# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-pa
_language=pa
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Punjabi"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.pa.po")
md5sums=('30356469d748765fc0c8b5114f606e15')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
