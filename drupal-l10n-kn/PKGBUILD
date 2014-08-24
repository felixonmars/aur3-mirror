# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-kn
_language=kn
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Kannada"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.kn.po")
md5sums=('a0485cb3ba91d4f66d967713f3a65494')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
