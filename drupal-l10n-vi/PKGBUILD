# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-vi
_language=vi
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Vietnamese"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.vi.po")
md5sums=('8e45ca693afbc254afd0bf947eaacbe9')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
