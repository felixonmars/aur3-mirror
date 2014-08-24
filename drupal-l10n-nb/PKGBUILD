# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-nb
_language=nb
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Norwegian Bokmål"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.nb.po")
md5sums=('297e10cb0021e0fa5468aff03f4bc285')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
