# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-th
_language=th
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Thai"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.th.po")
md5sums=('84a206df280e4b430a2d385f75f2b603')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
