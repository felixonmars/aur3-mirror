# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-ta
_language=ta
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Tamil"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.ta.po")
md5sums=('c35edf8449ccd549b78657c50bcba3fb')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
