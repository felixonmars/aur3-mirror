# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-zh-hant
_language=zh-hant
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Chinese, Traditional"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.zh-hant.po")
md5sums=('87ecece3f52ad1c0c356ef92b645352a')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
