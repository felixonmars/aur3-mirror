# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-fi
_language=fi
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Finnish"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.fi.po")
md5sums=('51a47fa29f547f61f7b0cb947cee1034')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
