# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-mr
_language=mr
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Marathi"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.mr.po")
md5sums=('7adb3d9d98e814ec3eb548f38ce560e3')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
