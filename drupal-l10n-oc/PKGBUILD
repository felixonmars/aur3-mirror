# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-oc
_language=oc
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Occitan"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.oc.po")
md5sums=('742d220b34960ba984fb2f5665c3c97b')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
