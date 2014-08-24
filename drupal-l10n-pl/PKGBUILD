# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-pl
_language=pl
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Polish"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.pl.po")
md5sums=('c40e87d123dc8740053227af0f19e244')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
