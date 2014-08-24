# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-eu
_language=eu
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Basque"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.eu.po")
md5sums=('d0d48b3d846c4e2002f8ebe0703b5a87')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
