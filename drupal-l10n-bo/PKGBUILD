# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-bo
_language=bo
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Tibetan"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.bo.po")
md5sums=('f3ac3e028d17911c4819b762d3a73ed0')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
