# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-ar
_language=ar
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Arabic"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.ar.po")
md5sums=('0df0bba2cb70e5a444cb2bc3d2a05475')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
