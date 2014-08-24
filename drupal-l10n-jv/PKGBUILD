# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-jv
_language=jv
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Javanese"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.jv.po")
md5sums=('77fa2695be69f2d75462df3fddce32a7')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
