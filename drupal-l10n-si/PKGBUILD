# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-si
_language=si
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Sinhala"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.si.po")
md5sums=('daf5b6c05bf27dad3b564ff102f3575a')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
