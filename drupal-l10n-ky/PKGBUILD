# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-ky
_language=ky
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Kyrgyz"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.ky.po")
md5sums=('cd754ac8dc53fcfbb054551391f6d3d4')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
