# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-ga
_language=ga
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Irish"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.ga.po")
md5sums=('7986029adddc9d6f031e0bb01aad7fd0')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
