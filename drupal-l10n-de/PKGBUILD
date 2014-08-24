# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-de
_language=de
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: German"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.de.po")
md5sums=('f701f2cd4dc108083eb418d78a9b9990')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
