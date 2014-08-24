# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-be
_language=be
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Belarusian"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.be.po")
md5sums=('f56428a7e76d9fc9d16c3685261ffba8')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
