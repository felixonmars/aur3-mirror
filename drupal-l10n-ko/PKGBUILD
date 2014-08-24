# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-ko
_language=ko
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Korean"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.ko.po")
md5sums=('e74181f4a237a481b8a90aaea4903b6d')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
