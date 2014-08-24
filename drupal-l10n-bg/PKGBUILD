# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-bg
_language=bg
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Bulgarian"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.bg.po")
md5sums=('70dac81e067228688806c312a8b4fc2a')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
