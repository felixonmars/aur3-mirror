# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-lo
_language=lo
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Laothian"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.lo.po")
md5sums=('6b316df42cb19032a95dfcaebd71cfd9')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
