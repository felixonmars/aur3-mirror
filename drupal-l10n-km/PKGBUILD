# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-km
_language=km
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Cambodian"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.km.po")
md5sums=('92cf8bd0881ef1188d82e3de15a92685')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
