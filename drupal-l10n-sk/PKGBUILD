# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-sk
_language=sk
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Slovak"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.sk.po")
md5sums=('504fcff04f774b073839a3d03956840f')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
