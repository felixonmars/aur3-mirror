# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-hi
_language=hi
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Hindi"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.hi.po")
md5sums=('4a436aea737ae34ca904a079b130192c')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
