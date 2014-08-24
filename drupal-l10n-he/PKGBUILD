# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-he
_language=he
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Hebrew"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.he.po")
md5sums=('3741f8bf769e0604098f5a7f25ad356b')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
