# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-ht
_language=ht
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Haitian Creole"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.ht.po")
md5sums=('c5b83e4d41d3058cb87ca32cac96ac37')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
