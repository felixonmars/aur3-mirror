# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-af
_language=af
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Afrikaans"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.af.po")
md5sums=('02eec2352849cd07916e1988bfde7a21')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
