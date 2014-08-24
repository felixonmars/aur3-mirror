# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-kk
_language=kk
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Kazakh"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.kk.po")
md5sums=('da5bb46a55743a2ddddcbbe57e9d8c03')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
