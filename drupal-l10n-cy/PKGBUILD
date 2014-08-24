# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-cy
_language=cy
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Welsh"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.cy.po")
md5sums=('12f9cf444f2f6d867bbec355d907df99')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
