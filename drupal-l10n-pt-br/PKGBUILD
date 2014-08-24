# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-pt-br
_language=pt-br
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Portuguese, Brazil"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.pt-br.po")
md5sums=('654f60ecbfed1978a29748cfe00ea1d3')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
