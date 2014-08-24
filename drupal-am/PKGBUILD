# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-am
_language=am
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Amharic"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.am.po")
md5sums=('d95c36d409baa2b32340289c28835d2a')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
