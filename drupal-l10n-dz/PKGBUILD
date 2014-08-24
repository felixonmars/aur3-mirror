# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-dz
_language=dz
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Bhutani"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.dz.po")
md5sums=('a75f893c4e8c0c595dd634e7d4d52ce1')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
