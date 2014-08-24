# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-gu
_language=gu
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Gujarati"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.gu.po")
md5sums=('2b2c2786d58f598263f84cd911e108b9')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
