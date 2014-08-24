# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-ml
_language=ml
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Malayalam"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.ml.po")
md5sums=('442891f9e367a4b5ce6f57312d22f870')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
