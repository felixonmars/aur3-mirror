# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-pt-pt
_language=pt-pt
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Portuguese, Portugal"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.pt-pt.po")
md5sums=('6403b238e5d9d7c06ecb99d97263acd1')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
