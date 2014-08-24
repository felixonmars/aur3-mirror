# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-ru
_language=ru
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Russian"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.ru.po")
md5sums=('d93aebdc010740a752d7f119c5915c1c')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
