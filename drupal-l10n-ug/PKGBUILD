# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-ug
_language=ug
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Uyghur"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.ug.po")
md5sums=('098a23d0db1886d4dea14b6eaf59342b')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
