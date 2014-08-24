# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-se
_language=se
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Northern Sami"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.se.po")
md5sums=('20d761ebdc6e5fe25b9e79adc862864c')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
