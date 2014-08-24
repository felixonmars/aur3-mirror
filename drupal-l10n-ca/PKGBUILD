# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-ca
_language=ca
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Catalan"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.ca.po")
md5sums=('f6b31f7e2aa333cd7a6aa7648430f950')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
