# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-id
_language=id
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Indonesian"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.id.po")
md5sums=('44d2e1f97a5deb5d72b47853403c883a')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
