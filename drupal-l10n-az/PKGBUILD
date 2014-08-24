# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-az
_language=az
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Azerbaijani"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.az.po")
md5sums=('56521b7be4166df751c79d9bbffbcbcd')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
