# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-et
_language=et
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Estonian"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.et.po")
md5sums=('f5af845a5b03e8f5642da99cea805b64')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
