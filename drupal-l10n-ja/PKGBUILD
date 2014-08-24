# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-ja
_language=ja
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Japanese"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.ja.po")
md5sums=('2959af846eeb771a9943957a0ea8d915')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
