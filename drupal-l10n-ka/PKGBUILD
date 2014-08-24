# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-ka
_language=ka
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Georgian"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.ka.po")
md5sums=('bfe77a54ce99a47452128d6336ea75ca')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
