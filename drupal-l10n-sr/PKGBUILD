# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-sr
_language=sr
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Serbian"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.sr.po")
md5sums=('5b4d1dab4752b2f07716b6309910df23')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
