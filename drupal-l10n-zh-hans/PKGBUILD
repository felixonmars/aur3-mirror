# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-zh-hans
_language=zh-hans
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Chinese, Simplified"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.zh-hans.po")
md5sums=('e2835643af92238b564ff60e3a3517b4')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
