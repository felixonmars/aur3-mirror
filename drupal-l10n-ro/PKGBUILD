# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-ro
_language=ro
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Romanian"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.ro.po")
md5sums=('d399236a80615a54b123874490e09966')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
