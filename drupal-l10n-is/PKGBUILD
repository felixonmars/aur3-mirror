# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-is
_language=is
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Icelandic"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.is.po")
md5sums=('9092e0b66e2e5356b67e982218dc2242')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
