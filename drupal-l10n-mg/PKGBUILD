# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-mg
_language=mg
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Malagasy"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.mg.po")
md5sums=('75207b4ef3ce59531db2820130b7f6a4')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
