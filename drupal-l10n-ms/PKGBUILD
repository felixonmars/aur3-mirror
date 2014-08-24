# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-ms
_language=ms
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Malay"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.ms.po")
md5sums=('bde801693883d2b5cdf12d12b243a88b')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
