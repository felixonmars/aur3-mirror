# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-mn
_language=mn
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Mongolian"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.mn.po")
md5sums=('9da573b109d9e135d6deae9cd8b26af7')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
