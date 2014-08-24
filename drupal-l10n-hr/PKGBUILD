# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-hr
_language=hr
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Croatian"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.hr.po")
md5sums=('f2ef939ab9307911da26d15f09d0b6f8')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
