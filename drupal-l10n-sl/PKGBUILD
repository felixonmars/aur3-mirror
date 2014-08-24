# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-sl
_language=sl
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Slovenian"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.sl.po")
md5sums=('201ce013db478673bf19631d80aaa89a')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
