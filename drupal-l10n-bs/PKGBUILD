# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-bs
_language=bs
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Bosnian"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.bs.po")
md5sums=('5a2f81237ea65f3dce7a1d670b0fd35e')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
