# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-sv
_language=sv
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Swedish"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.sv.po")
md5sums=('d647aa951e08fa4917370c2ea31752dd')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
