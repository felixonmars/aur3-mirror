# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-gl
_language=gl
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Galician"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.gl.po")
md5sums=('1aade7ea1dc75c6da1a025508820c751')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
