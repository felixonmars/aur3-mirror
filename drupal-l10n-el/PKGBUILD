# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-el
_language=el
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Greek"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.el.po")
md5sums=('5de740e5685b4efbff906a248d1b98f6')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
