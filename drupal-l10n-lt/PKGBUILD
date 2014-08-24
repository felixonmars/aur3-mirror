# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-lt
_language=lt
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Lithuanian"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.lt.po")
md5sums=('c6cf41dee6939612f805d78daaa062de')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
