# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-fo
_language=fo
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Faeroese"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.fo.po")
md5sums=('25f4a8acd1d25302f48bc049dc384b0d')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
