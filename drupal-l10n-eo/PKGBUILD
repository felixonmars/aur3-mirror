# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-eo
_language=eo
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Esperanto"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.eo.po")
md5sums=('3e1441c712d70ff6fe3e8c061a7b4ea1')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
