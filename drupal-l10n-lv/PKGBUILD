# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-lv
_language=lv
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Latvian"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.lv.po")
md5sums=('d6d96cdf8c6848ae6ac84efcbae49361')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
