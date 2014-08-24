# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-or
_language=or
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Oriya"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.or.po")
md5sums=('d59716f294765951239714ce719757b8')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
