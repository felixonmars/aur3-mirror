# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-fr
_language=fr
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: French"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.fr.po")
md5sums=('e1c022c473381d35853ccfcf44e77176')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
