# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-gd
_language=gd
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Scots Gaelic"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.gd.po")
md5sums=('162d1d7b2ee0015c66b590c32963177e')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
