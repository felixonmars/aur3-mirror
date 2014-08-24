# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-fa
_language=fa
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Persian"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.fa.po")
md5sums=('0f2c5061d630d3df15d23774108cb9eb')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
