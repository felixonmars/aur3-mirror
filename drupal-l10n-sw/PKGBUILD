# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-sw
_language=sw
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Swahili"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.sw.po")
md5sums=('db0904250413b68b730e96c47b479e15')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
