# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-bn
_language=bn
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Bengali"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.bn.po")
md5sums=('e19d5f9bb28d512efec0cd631e4d0a5e')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
