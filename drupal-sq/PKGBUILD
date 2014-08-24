# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-sq
_language=sq
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Albanian"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.sq.po")
md5sums=('4f60ef36294f5cf306ae47a83b039c8f')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
