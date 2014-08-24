# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-it
_language=it
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Italian"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.it.po")
md5sums=('609dc7ab1676f3b73d71d8c0ac97217a')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
