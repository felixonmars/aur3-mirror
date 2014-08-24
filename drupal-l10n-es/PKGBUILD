# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-es
_language=es
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Spanish"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.es.po")
md5sums=('40d14fd3f592af117ffe02b8b03646e1')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
