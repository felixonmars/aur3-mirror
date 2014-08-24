# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-hy
_language=hy
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Armenian"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.hy.po")
md5sums=('f976222bfbd38e60d6fd95252cc81389')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
