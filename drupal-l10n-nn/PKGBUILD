# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-nn
_language=nn
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Norwegian Nynorsk"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.nn.po")
md5sums=('16f926a5a15680a4e057d066addedaec')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
