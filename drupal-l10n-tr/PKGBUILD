# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-tr
_language=tr
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Turkish"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.tr.po")
md5sums=('be366184a1e0bffd2c40a819bcb2912f')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
