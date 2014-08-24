# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-ur
_language=ur
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Urdu"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.ur.po")
md5sums=('d4a66f4148cdb26032a176fbed7f2da5')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
