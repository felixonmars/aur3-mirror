# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-hu
_language=hu
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Hungarian"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.hu.po")
md5sums=('c981a15956dacd42d28239da2fb6490a')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
