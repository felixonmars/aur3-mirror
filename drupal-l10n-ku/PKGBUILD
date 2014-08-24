# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-ku
_language=ku
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Kurdish"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.ku.po")
md5sums=('e28bc896f8bfb1d86bb9d83bfc2f84b8')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
