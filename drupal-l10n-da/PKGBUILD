# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-da
_language=da
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Danish"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.da.po")
md5sums=('fa89e7fcc1c74dd0e0ed00ffebba550c')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
