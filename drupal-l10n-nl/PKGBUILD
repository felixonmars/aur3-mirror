# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-nl
_language=nl
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Dutch"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.nl.po")
md5sums=('9c7c95ebb35134bf487e723288f4059c')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
