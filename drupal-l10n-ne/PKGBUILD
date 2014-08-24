# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-ne
_language=ne
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Nepali"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.ne.po")
md5sums=('6d60d87c1ee0f3d14e0f33c234056f86')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
