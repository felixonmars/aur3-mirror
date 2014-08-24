# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-my
_language=my
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Burmese"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.my.po")
md5sums=('ae304c83c7a6f96ff20e65e702f181c5')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
